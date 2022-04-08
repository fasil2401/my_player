import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/popupmenu/data/menu_list.dart';
import 'package:my_player/popupmenu/model/menu_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CustomListTileVideos extends StatefulWidget {
  CustomListTileVideos(
      {Key? key,
      required this.subtite,
      required this.trailicon,
      required this.index,
      required this.text,
      required this.url,
      required this.folderName,
      required this.pathList})
      : super(key: key);

  final bool subtite;
  final bool trailicon;
  final int index;
  final String text;
   var url;
  final String folderName;
  List<String> pathList = [];

  @override
  State<CustomListTileVideos> createState() => _CustomListTileVideosState();
}

class _CustomListTileVideosState extends State<CustomListTileVideos> {
  String? _thumbnailFile;

  String? _thumbnailUrl;

  Uint8List? _thumbnailData;
  @override
  void initState() {
    setState(() {
      
    });
    super.initState();

   
    
  }

  // Future<File> copyAssetFile(String assetFileName) async {
  //   Directory tempDir = await getTemporaryDirectory();
  //   final byteData = await rootBundle.load(assetFileName);

  //   File videoThumbnailFile = File("${tempDir.path}/$assetFileName")
  //     ..createSync(recursive: true)
  //     ..writeAsBytesSync(byteData.buffer
  //         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //   return videoThumbnailFile;
  // }

  // void generateThumbnail() async {
  //   // File videoTempFile1 = await copyAssetFile("assets/nature1.mp4");
  //   // File videoTempFile2 = await copyAssetFile("assets/nature2.mp4");

  //   _thumbnailFile = await VideoThumbnail.thumbnailFile(
  //       video: widget.pathList[widget.index],
  //       thumbnailPath: (await getTemporaryDirectory()).path,
  //       imageFormat: ImageFormat.PNG);
  //   final uint8list = await VideoThumbnail.thumbnailData(
  //     video: widget.pathList[widget.index],
  //     imageFormat: ImageFormat.JPEG,
  //     maxWidth:
  //         128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  //     quality: 25,
  //   );
  //   _thumbnailUrl = await VideoThumbnail.thumbnailFile(
  //       video: widget.pathList[widget.index],
  //       thumbnailPath: (await getTemporaryDirectory()).path,
  //       imageFormat: ImageFormat.WEBP);

  //   // _thumbnailData = await VideoThumbnail.thumbnailData(
  //   //   video: videoTempFile2.path,
  //   //   imageFormat: ImageFormat.JPEG,
  //   //   // maxHeight: 300,
  //   //   // maxWidth: 300,
  //   //   quality: 75,
  //   // );

  //   setState(() {});
  // }

  List<String> viewList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => PlayerScreen(
                    path: widget.pathList[widget.index], name: widget.pathList[widget.index].split('/').last,
                  )));
        },
        child: SizedBox(
          // color: Colors.grey,
          width: double.infinity,
          // height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Stack(alignment: Alignment.center, children: [
                   Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      height: MediaQuery.of(context).size.width * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          //  image: FileImage(File(fileKitti))))),
                          image: MemoryImage(widget.url),
                        ),
                        // image: DecorationImage(
                        //     fit: BoxFit.fill,
                        //     image: FileImage(File(_thumbnailFile!))),
                      ),
                    ) ,
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.black45,
                      child: Icon(
                        Icons.play_arrow,
                        size: 15,
                        color: Colors.white,
                      ),
                    )
                  ]),
                  // SizedBox(
                  //   width:  MediaQuery.of(context).size.width * 0.2,

                  //   child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(6.0),
                  //   child: Image.network(
                  //     url,

                  //   ),
                  //               ),
                  // ),
                  // Icon(
                  //   MyFlutterApp.folder_1,
                  //   size: MediaQuery.of(context).size.width * 0.13,
                  // ),

                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Text(
                          widget.text,
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: MediaQuery.of(context).size.width * 0.046,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.subtite,
                        child: Text(
                          '${widget.index} Videos',
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              // fontSize:  MediaQuery.of(context).size.width * 0.06,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: widget.trailicon,
                    child: PopupMenuButton<MenuItem>(
                      color: const Color.fromARGB(242, 237, 241, 250),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.grey),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        ...MenuListItems.itemFirst.map(buildItem).toList(),
                        const PopupMenuDivider(),
                        ...MenuListItems.itemSecond.map(buildItem).toList(),
                      ],
                    ),
                    // child: IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.more_vert),
                    // ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
      value: item,
      child: Row(
        children: [
          Icon(
            item.icon,
            size: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            item.modeltext,
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ],
      ));

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuListItems.itemSettings:
        // Navigator.of(context).pop();
        break;
      case MenuListItems.itemShare:
        // Navigator.of(context).pop();
        break;
      case MenuListItems.itemSignOut:
        // Navigator.of(context).pop();
        break;
      default:
    }
  }
}
