import 'package:flutter/material.dart';
import 'package:my_player/Screens/navigation_screens/video_list.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';

class CustomListTileFolder extends StatelessWidget {
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
  List<String> viewList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  VideoList(folderName: folderName, pathList: pathList)));
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
                  //   ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Image.network(
                  //     'https://www.filmibeat.com/img/2022/02/xmammootty-bheeshma-parvam-overseas-rights-1645153523.jpg.pagespeed.ic.5MkMLClsne.jpg',
                  //     width:  MediaQuery.of(context).size.width * 0.24,
                  //   ),
                  // ),
                  Icon(
                    MyFlutterApp.folder_1,
                    size: MediaQuery.of(context).size.width * 0.13,
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
                          text,
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: MediaQuery.of(context).size.width * 0.046,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: subtite,
                        child: Text(
                          '$index Videos',
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
                    visible: trailicon,
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
