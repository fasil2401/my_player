import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/bottom_navigation/screenhome.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/main.dart';
import 'package:my_player/model/model.dart';
import 'package:my_player/popupmenu/data/menu_list.dart';
import 'package:my_player/popupmenu/model/menu_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
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
      required this.pathList,
      required this.Customkey,
      required this.isFavorite,
      this.voidCallback})
      : super(key: key);

  final bool subtite;
  final bool trailicon;
  final bool isFavorite;
  final int index;
  final String text;
  var url;
  final String folderName;
  List<String> pathList = [];
  // List<String> keyList = [];
  var Customkey;
  final VoidCallback? voidCallback;

  @override
  State<CustomListTileVideos> createState() => _CustomListTileVideosState();
}

class _CustomListTileVideosState extends State<CustomListTileVideos> {
  var boxVideos = Hive.box<Videos>(videoBox);
  var boxFavorite = Hive.box<Favorites>(favoriteBox);

  @override
  void initState() {
    // setState(() {});
    super.initState();
  }

  List<String> viewList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlayerScreen(
                    path: widget.pathList[widget.index],
                    name: widget.pathList[widget.index].split('/').last,
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
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
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black45,
                        child: Icon(
                          Icons.play_arrow,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                        // const PopupMenuDivider(),
                        // ...MenuListItems.itemSecond.map(buildItem).toList(),
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
              widget.isFavorite ? item.selectedIcon : item.icon,
              size: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              widget.isFavorite ? item.selectedtext : item.modeltext,
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ],
        ),
      );

  Future<void> onSelected(BuildContext context, MenuItem item) async {
    switch (item) {
      case MenuListItems.itemFavorite:
        // Navigator.of(context).pop();
        // widget.isFavorite!
        //     ? boxFavorite.delete(widget.Customkey)
        //     : boxFavorite.add(Favorites(
        //         favorite: widget.pathList[widget.index],
        //         thumb: widget.url,
        //       ));

        // if (widget.isFavorite == true) {
        //   setState(() {
        //     boxFavorite.delete(widget.Customkey);
        //     boxVideos.put(
        //         widget.index,
        //         Videos(
        //             paths: widget.pathList[widget.index],
        //             thumb: widget.url,
        //             fav: false),);
        //   });

        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ))
        // } else {
        //   setState(() {
        //     boxVideos.put(
        //         widget.index,
        //         Videos(
        //             paths: widget.pathList[widget.index],
        //             thumb: widget.url,
        //             fav: true));

        //     boxFavorite.add(Favorites(
        //       favorite: widget.pathList[widget.index],
        //       thumb: widget.url,
        //     ));
        //   });

        //   // setState(() {});
        // }

        // boxVideos.putAt(
        //     widget.index,
        //     Videos(
        //         paths: widget.pathList[widget.index],
        //         thumb: widget.url,
        //         fav: true));
        // boxFavorite.add(Favorites(
        //   favorite: widget.pathList[widget.index],
        //   thumb: widget.url,
        // ));
        if (widget.isFavorite == true) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Delete"),
                content: const Text("Do you want to remove it?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("No")),
                  TextButton(
                      onPressed: () {
                       deleteFavorites();
                        Navigator.of(context).pop();

                        // Navigator.pop(context);
                        // boxFavorite.get(widget.Customkey);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => AllVideoList()));
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ScreenHome()));
                        // setState(() {});

                        // Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Removed Successfully")));
                      },
                      // widget.voidCallback,
                      child: const Text("Yes"))
                ],
              );
            },
          );
        } else {
          // Box<Videos> value;
          // List<Videos> videopaths = value.values.toList();
          ValueNotifier(
            boxFavorite.put(
              widget.index,
              Favorites(
                favorite: widget.pathList[widget.index],
                thumb: widget.url,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Added to favorites")));

        }

        break;
      case MenuListItems.itemShare:
        // Navigator.of(context).pop();
        await Share.shareFiles([widget.pathList[widget.index]]);
        break;
      // case MenuListItems.itemSignOut:
      //   // Navigator.of(context).pop();
      //   break;
      default:
    }
  }

  void deleteFavorites() async {
    // await boxFavorite.delete(widget.Customkey);
    // final userToDelete =
    // await _userBox.values.firstWhere((element) => element.id == id);
    // await userToDelete.delete();
    final videotoremove = boxFavorite.values.firstWhere(
        (element) => element.favorite == widget.pathList[widget.index]);
    await videotoremove.delete();
  }
}
