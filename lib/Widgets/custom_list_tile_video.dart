import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/popupmenu/data/menu_list.dart';
import 'package:my_player/popupmenu/model/menu_item.dart';

class CustomListTileVideos extends StatelessWidget {
  CustomListTileVideos(
      {Key? key,
      required this.subtite,
      required this.trailicon,
      required this.index,
      required this.text,
      required this.url,
       required this.folderName,
      required this.pathList
      
      })
      : super(key: key);

  final bool subtite;
  final bool trailicon;
  final int index;
  final String text;
  final String url;
   final String folderName;
List<String>pathList = [];
List<String>viewList = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  PlayerScreen(path: pathList[index],)));
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: MediaQuery.of(context).size.width * 0.13,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(6.0),
                      // image: DecorationImage(
                      //     fit: BoxFit.fill, image: NetworkImage(url)),
                    ),
                  ),
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
                    child: PopupMenuButton<MenuItem>(
                      color: const Color.fromARGB(242, 237, 241, 250),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.grey
                          ),
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
