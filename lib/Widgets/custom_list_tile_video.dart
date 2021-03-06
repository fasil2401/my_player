// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/bottom_navigation/screenhome.dart';
import 'package:my_player/controllers/Playlist_controller/playlist_controller.dart';
import 'package:my_player/controllers/favotite_controller/favorite.dart';
import 'package:my_player/controllers/playlist_video_controller/playlist_video_controller.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/main.dart';
import 'package:my_player/model/model.dart';
import 'package:my_player/popupmenu/data/menu_list.dart';
import 'package:my_player/popupmenu/model/menu_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CustomListTileVideos extends StatelessWidget {
  CustomListTileVideos(
      {Key? key,
      required this.subtite,
      required this.trailicon,
      required this.index,
      required this.text,
      required this.url,
      required this .path,
      required this.folderName,
      required this.pathList,
      required this.Customkey,
      required this.isFavorite,
      this.voidCallback})
      : super(key: key);
  final String path;
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


  // var boxVideos = Hive.box<Videos>(videoBox);
  // var boxFavorite = Hive.box<Favorites>(favoriteBox);
  // var boxPlaylist = Hive.box<PlayList>(playlistBox);
  // var boxPlaylistVideo = Hive.box<PlayListVideos>(playlistVideoBox);
  List<String> _playListNames = [];

  final  favController = Get.put(FavoriteController());
  final playlistControl = Get.put(PlaylistController());
  final playlistvideoControl = Get.put(PlaylistVideoController());

  
  List<String> viewList = [];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlayerScreen(
                    path: path,
                    name: path.split('/').last,
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
                            image:url == null
                                ? AssetImage('assets/images/icon.png')
                                    as ImageProvider
                                : MemoryImage(url),
                          ),
                        ),
                      ),
                      const CircleAvatar(
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
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      Visibility(
                        visible:subtite,
                        child: Text(
                          '${index} Videos',
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
                    visible:trailicon,
                    child: PopupMenuButton<MenuItems>(
                      color: const Color.fromARGB(242, 237, 241, 250),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.grey),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        ...MenuListItems.itemFirst.map(buildItem).toList(),
                      ],
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

  PopupMenuItem<MenuItems> buildItem(MenuItems item) => PopupMenuItem<MenuItems>(
        value: item,
        child: Row(
          children: [
            Icon(
             isFavorite ? item.selectedIcon : item.icon,
              size: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
             isFavorite ? item.selectedtext : item.modeltext,
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ],
        ),
      );

  Future<void> onSelected(BuildContext context, MenuItems item) async {
    switch (item) {
      case MenuListItems.itemFavorite:
        // if (isFavorite == true) {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: const Text("Delete"),
        //         content: const Text("Do you want to remove it?"),
        //         actions: [
        //           TextButton(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //               },
        //               child: const Text("No")),
        //           TextButton(
        //               onPressed: () {
        //                 deleteFavorites();
        //                 Navigator.of(context).pop();
        //                 Navigator.of(context).pushReplacement(MaterialPageRoute(
        //                     builder: (context) => ScreenHome(
        //                           isSatrting: 'no',
        //                         )));

        //                 ScaffoldMessenger.of(context).showSnackBar(
        //                     const SnackBar(
        //                         duration: Duration(seconds: 1),
        //                         behavior: SnackBarBehavior.floating,
        //                         margin: EdgeInsets.only(bottom: 80.0),
        //                         content: Text("Removed Successfully")));
        //               },
        //               child: const Text("Yes"))
        //         ],
        //       );
        //     },
        //   );
        // } else {
        //   ValueNotifier(
        //     boxFavorite.put(
        //      index,
        //       Favorites(
        //         favorite: widget.pathList[widget.index],
        //         thumb: widget.url,
        //       ),
        //     ),
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //       duration: Duration(seconds: 1),
        //       behavior: SnackBarBehavior.floating,
        //       margin: EdgeInsets.only(bottom: 70.0),
        //       content: Text("Added to favorites")));
        // }
        //  favController.observableFavoriteBox.clear();
        favController.updateFavorites(item: Favorites(favorite: path, thumb: url,), path: path);
        break;

      case MenuListItems.itemPLaylist:
        // Navigator.of(context).pop();
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         contentPadding: const EdgeInsets.only(top: 6),
        //         title: Text(
        //           'Playlists',
        //           style: TextStyle(
        //             fontFamily: 'Poppins',
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         content: Expanded(
        //           child: ValueListenableBuilder(
        //                     valueListenable: boxPlaylist.listenable(),
        //                     builder: (BuildContext context, Box<PlayList> value,
        //                         Widget? child) {
        //                       List<PlayList> _playListNames =
        //                           value.values.toList();
        //                       return ListView.builder(
        //                         itemCount: _playListNames.length,
        //                         itemBuilder: (BuildContext context, int index) {
        //                           return _playListNames.isEmpty
        //                               ? const Center(
        //                                   child: Text('data'),
        //                                 )
        //                               : InkWell(
        //                                   onTap: () {
        //                                     checking(pathList[widget.index], _playListNames[index].name);
        //                                     // boxPlaylistVideo.add(PlayListVideos(
        //                                     //     path:
        //                                     //         widget.pathList[widget.index],
        //                                     //     id: _playListNames[index].name));
        //                                     // addToPlaylist(_playListNames[index].name);
        //                                     //  _playListNames[index].playList.add(widget.pathList[widget.index]);
        //                                     Navigator.of(context).pop();
        //                                     print(
        //                                         'path ${widget.pathList[widget.index]} Addeddd to ${_playListNames[index].name}');
        //                                   },
        //                                   child: ListTile(
        //                                     title: Text(
        //                                       _playListNames[index]
        //                                           .name
        //                                           .toString(),
        //                                       style: const TextStyle(
        //                                         fontFamily: 'Poppins',
        //                                         fontSize: 18,
        //                                         fontWeight: FontWeight.w400,
        //                                       ),
        //                                     ),
        //                                     leading: const Icon(
        //                                         MyFlutterApp.video_library),
        //                                   ),
        //                                 );
        //                         },
        //                       );
        //                     }),
        //         ),
        //       );
        //     });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.only(top: 6),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          'Playlists',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      // child: ValueListenableBuilder(
                      //     valueListenable: boxPlaylist.listenable(),
                      //     builder: (BuildContext context, Box<PlayList> value,
                      //         Widget? child) {
                      //       List<PlayList> _playListNames =
                      //           value.values.toList();
                      //       return ListView.builder(
                      //         itemCount: _playListNames.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return _playListNames.isEmpty
                      //               ? const Center(
                      //                   child: Text('data'),
                      //                 )
                      //               : InkWell(
                      //                   onTap: () {
                      //                     checking(
                      //                         pathList[index],
                      //                         _playListNames[index].name);
                      //                     // boxPlaylistVideo.add(PlayListVideos(
                      //                     //     path:
                      //                     //         pathList[widget.index],
                      //                     //     id: _playListNames[index].name));
                      //                     // addToPlaylist(_playListNames[index].name);
                      //                     //  _playListNames[index].playList.add(widget.pathList[widget.index]);
                      //                     Navigator.of(context).pop();
                      //                     print(
                      //                         'path ${pathList[index]} Addeddd to ${_playListNames[index].name}');
                      //                   },
                      //                   child: Padding(
                      //                     padding: EdgeInsets.symmetric(
                      //                         horizontal: 12, vertical: 5),
                      //                     child: Container(
                      //                       decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(10),
                      //                         color: Color.fromARGB(
                      //                             255, 205, 224, 255),
                      //                       ),
                      //                       child: ListTile(
                      //                         title: Text(
                      //                           _playListNames[index]
                      //                               .name
                      //                               .toString(),
                      //                           style:  TextStyle(
                      //                             color: Colors.black.withOpacity(0.8),
                      //                             fontFamily: 'Poppins',
                      //                             fontSize: 13.sp,
                      //                             fontWeight: FontWeight.w400,
                      //                           ),
                      //                         ),
                      //                         leading: Icon(
                      //                           MyFlutterApp.video_library,
                      //                           color: Color(0xFF100374),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 );
                      //         },
                      //       );
                      //     }),

                      child: GetBuilder<PlaylistController>(
                        builder: (cont){
                          List<dynamic> _playListNames = cont.observablePlaylistBox.values.toList();
                                  return ListView.builder(
                              itemCount: _playListNames.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _playListNames.isEmpty
                                    ? const Center(
                                        child: Text('data'),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          playlistvideoControl.updatePlayListVideo(item: PlayListVideos(path: path, id: _playListNames[index].name), playlist:  _playListNames[index].name, path: path);
                                          // checking(
                                          //     pathList[index],
                                          //     _playListNames[index].name);
                                          // boxPlaylistVideo.add(PlayListVideos(
                                          //     path:
                                          //         pathList[widget.index],
                                          //     id: _playListNames[index].name));
                                          // addToPlaylist(_playListNames[index].name);
                                          //  _playListNames[index].playList.add(widget.pathList[widget.index]);
                                          Navigator.of(context).pop();
                                          print(
                                              'path ${pathList[index]} Addeddd to ${_playListNames[index].name}');
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromARGB(
                                                  255, 205, 224, 255),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                _playListNames[index]
                                                    .name
                                                    .toString(),
                                                style:  TextStyle(
                                                  color: Colors.black.withOpacity(0.8),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              leading: Icon(
                                                MyFlutterApp.video_library,
                                                color: Color(0xFF100374),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                        });})
                    )
                  ],
                ),
              ),
            );
          },
        );
        break;
      case MenuListItems.itemShare:
        // Navigator.of(context).pop();
        await Share.shareFiles([pathList[index]]);
        break;

      default:
    }
  }

  // void checking(String path, String id) {
  //   List<String> videolist = [];
  //   List<PlayListVideos> _listplayVideo =
  //       Hive.box<PlayListVideos>(playlistVideoBox).values.toList();
  //   for (var i = 0; i < _listplayVideo.length; i++) {
  //     videolist.add(_listplayVideo[i].path);
  //   }
  //   if (!videolist.contains(path)) {
  //     boxPlaylistVideo.add(PlayListVideos(path: path, id: id));
  //   } else {
  //     // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     //     duration: Duration(seconds: 1),
  //     //     behavior: SnackBarBehavior.floating,
  //     //     margin: EdgeInsets.only(bottom: 70.0),
  //     //     content: Text("Already in list")));
  //   }
  // }

  // void deleteFavorites() async {
  //   // await boxFavorite.delete(widget.Customkey);
  //   // final userToDelete =
  //   // await _userBox.values.firstWhere((element) => element.id == id);
  //   // await userToDelete.delete();
  //   final videotoremove = boxFavorite.values.firstWhere(
  //       (element) => element.favorite == pathList[index]);
  //   await videotoremove.delete();
  // }
}
