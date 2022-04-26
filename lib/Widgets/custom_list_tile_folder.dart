import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/video_list.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../main.dart';
import '../model/model.dart';
import '../provider/search_files.dart';

class CustomListTileFolder extends StatefulWidget {
  CustomListTileFolder(
      {Key? key,
      required this.subtite,
      required this.trailicon,
      required this.index,
      required this.text,
      required this.folderName,
      required this.pathList})
      : super(key: key);

  final bool subtite;
  final bool trailicon;
  final int index;
  final String text;
  final String folderName;
  List<String> pathList = [];

  @override
  State<CustomListTileFolder> createState() => _CustomListTileFolderState();
}

class _CustomListTileFolderState extends State<CustomListTileFolder> {
  List<String> viewList = [];

  List<String> _pathList = [];

  List thumbs = [];

  var boxVideos = Hive.box<Videos>(videoBox);

  Future getThumb() async {
    print(_pathList);
    // var listBox = boxVideos.values.toList();
    for (var i = 0; i < _pathList.length; i++) {
      var key = (await VideoThumbnail.thumbnailData(
        video: _pathList[i],
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 25,
      ));
      thumbs.add(key);
      setState(() {});
      print('hi ${_pathList[i]}');
      boxVideos.put(i, Videos(paths: _pathList[i], thumb: thumbs[i],fav:  false));

      // print(listBox[i]);
    }
  }

  Future getFiles() async {
    // await Permission.storage.request();
    final value = '.mp4,.mkv,.webm'
    // final value = '.mp4'
        .trim()
        .replaceAll(' ', '')
        .split(',');
    if (value.isEmpty) {
      return;
    }
    SearchFilesInStorage.searchInStorage(
      value,
          (List<String> data) {
        _pathList.clear();
        // print(data);
        setState(() {
          _pathList.addAll(data);
          // for (var i = 0; i < _pathList.length; i++) {
          //   List<String> folder = _pathList[i].split('/').toList();
          //   String name = folder[folder.length - 2];
          //   //  folderName.add(name);
          // }
          // folderNameFinal = folderName.toSet().toList();
          // folderNameFinal.remove('0');
          // pathListMain= _pathList;
        });
      },
          (error) {},
    );
  }

  Future  sychronise() async{
    getFiles();

  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   sychronise();
  // }

// @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: ()async {

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  VideoList(folderName: widget.folderName, pathList: widget.pathList)));
          // getFiles();
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
                  Icon(
                    MyFlutterApp.folder,
                    size: MediaQuery.of(context).size.width * 0.11,
                  ),
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
                            fontSize: MediaQuery.of(context).size.width * 0.047,
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
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
