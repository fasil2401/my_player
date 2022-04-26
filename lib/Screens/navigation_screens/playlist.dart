import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/playlist_inner.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/model/model.dart';

import '../../main.dart';

class PlayListScreen extends StatefulWidget {
  PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  TextEditingController nameController = TextEditingController();
  List<String> _playList = [];
  List thumbs = [];

  bool isFavorite = true;
  var key;

  var boxFavorites = Hive.box<Favorites>(favoriteBox);
  var boxPlaylist = Hive.box<PlayList>(playlistBox);

  // List<Map<String, dynamic>> _items = [];
  // void refreshItems() {
  //   final data = boxFavorites.keys.map((key) {
  //     final value = boxFavorites.get(key);
  //     return {
  //       "key": key,
  //     };
  //   }).toList();

  //   setState(() {
  //     _items = data.toList();
  //     // we use "reversed" to sort items in order from the latest to the oldest
  //   });
  // }
  // @override
  // void initState() {
  //   setState(() {});
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'Playlist',
      ),
      body: ValueListenableBuilder(
        valueListenable: boxPlaylist.listenable(),
        builder: (BuildContext context, Box<PlayList> value, Widget? child) {
          List<PlayList> _playListNames = value.values.toList();
          return Stack(
            children: [
              ListView.builder(
                itemCount: _playListNames.length,
                itemBuilder: (BuildContext context, int index) {
                  List<String> viewList = _playListNames[index].playList;

                  return _playListNames.isEmpty
                      ? const Center(
                          child: Text('data'),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => PlayListScreenInner(
                                    name: _playListNames[index].name.toString(),
                                    paths: viewList)));
                          },
                          child: ListTile(
                            title: Text(
                              _playListNames[index].name.toString(),
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            leading: const Icon(MyFlutterApp.video_library),
                          ),
                        );
                },
              ),
              Positioned(
                // height: 10,
                bottom: 80,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Create Playlist',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        print('buttton pressinggg');
                        showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                title: const Center(
                                  child: Text(
                                    'Create Playlist',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  height: 135,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              hintText: 'Name',
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF100374),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              )),
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if (nameController
                                                .text.isNotEmpty) {
                                              await Hive.openBox("pathlist");

                                              // await boxPlaylist.add(PlayList(
                                              //     playList: _playList,
                                              //     name: nameController.text));
                                              //  createPlaylist(nameController.text,_playList);
                                              if (!nameCheck(
                                                  nameController.text)) {
                                                await boxPlaylist.add(PlayList(
                                                    playList: _playList,
                                                    name: nameController.text));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        duration: Duration(
                                                            seconds: 1),
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        margin: EdgeInsets.only(
                                                            bottom: 70.0),
                                                        content: Text(
                                                            "Already in list")));
                                              }

                                              print('Adding to play list');
                                              nameController.clear();
                                              Navigator.of(context).pop();
                                            } else {
                                              // await boxPlaylist.clear();
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFF100374),
                                            fixedSize: const Size(150, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          child: const Text(
                                            'Create Playlist',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      backgroundColor: const Color(0xFF100374),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
          // return ListView.builder(
          //     itemCount: _playListNames.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return _playListNames.isEmpty
          //           ? Center(
          //               child: Text('data'),
          //             )
          //           : ListTile(
          //               title: Text(
          //                 _playListNames[index].name.toString(),
          //                 style: TextStyle(
          //                   fontFamily: 'Poppins',
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               leading: Icon(MyFlutterApp.video_library),
          //             );
          //     });
        },
      ),

      // body: ValueListenableBuilder(
      //     valueListenable: boxFavorites.listenable(),
      //     builder: (BuildContext context, Box<Favorites> value, Widget? child) {
      //       List<Favorites> videopaths = value.values.toList();
      //       print('ivde aanooov favorite videos  ${videopaths}');
      //       for (var i = 0; i < videopaths.length; i++) {
      //         // keyList.add(videopaths[i].key);
      //
      //         key = videopaths[i].key;
      //         _pathList.add(videopaths[i].favorite);
      //         thumbs.add(videopaths[i].thumb);
      //       }
      //       return ListView.builder(
      //         // physics: NeverScrollableScrollPhysics(),
      //         itemCount: _pathList.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return CustomListTileVideos(
      //             subtite: false,
      //             trailicon: true,
      //             index: index,
      //             text: _pathList[index].split('/').last,
      //             url: thumbs[index],
      //             folderName: '',
      //             pathList: _pathList,
      //             Customkey: key,
      //             isFavorite: isFavorite,
      //             voidCallback: (){
      //               // deleteFavorites();
      //               // boxFavorites.deleteAt(index);
      //               // setState(() {
      //               //
      //               // });
      //
      //               // Navigator.pop(context);
      //               // // boxFavorite.get(widget.Customkey);
      //               // // Navigator.of(context).push(MaterialPageRoute(
      //               // //     builder: (context) => AllVideoList()));
      //               // await Navigator.of(context).push(MaterialPageRoute(
      //               //     builder: (context) => FavoriteVideoList()));
      //               // setState(() {});
      //
      //               Navigator.pop(context);
      //
      //               ScaffoldMessenger.of(context).showSnackBar(
      //                   const SnackBar(
      //                       content: Text("Removed Successfully")));
      //             },
      //           );
      //         },
      //       );
      //     }),
      // body: ListView.builder(
      //   itemCount: file_names.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return CustomListTileVideos(
      //         subtite: false, trailicon: true, index: index, text: file_names[index],url: file_url[index],);
      //   },
      // ),
    );
  }

  bool nameCheck(String text) {
    List<PlayList> _list = Hive.box<PlayList>(playlistBox).values.toList();
    bool check = false;
    for (int i = 0; i < _list.length; i++) {
      if (_list[i].name.trim() == text.trim()) {
        check = true;
        break;
      }
    }
    return check;
  }
}
