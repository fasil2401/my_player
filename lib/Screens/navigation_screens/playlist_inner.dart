import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/playlist.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/bottom_navigation/screenhome.dart';
import 'package:my_player/controllers/playlist_video_controller/playlist_video_controller.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/model/model.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class PlayListScreenInner extends StatelessWidget {
  String name;

  PlayListScreenInner({
    Key? key,
    required this.name,
  }) : super(key: key);

  List<String> paths = [];

  final playlistvideoControl = Get.put(PlaylistVideoController());

  TextEditingController nameController = TextEditingController();

 final List<PlayListVideos> _playList = [];

 final List<String> _paths =[];

  bool isFavorite = true;

  var key;

  // var boxPlaylist = Hive.box<PlayList>(playlistBox);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titletext: name,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GetBuilder<PlaylistVideoController>(
          builder: (cont) {
            List<dynamic> videos = cont.observablePlaylistVideoBox.values.toList();
            videos.forEach((element) {
              if(name == element.id){
                _playList.add(element);
              }
             });
             _playList.forEach((element) {
               _paths.add(element.path);
              });
              

            return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: _playList.length,
              itemBuilder: (BuildContext context, int index) {
                return _playList.isEmpty
                    ? const Center(
                        child: Text('data'),
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PlayerScreen(
                                    name: _paths[index].split('/').last,
                                    path: _paths[index].toString(),
                                  )));
                        },
                        onLongPress: () {
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
                                        // deletePlaylistVideo(
                                        //     _playList[index].toString());
                                        // Navigator.of(context).pop();
                                        // // Navigator.of(context).pop();
                                        // Navigator.of(context).pushReplacement(
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         PlayListScreenInner(
                                        //             name: name),
                                        //   ),
                                        // );
                                        playlistvideoControl.removePlaylistVideo(id: name, path: _paths[index]);  
                                        Navigator.pop(context);
                                        playlistvideoControl.update();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            duration: Duration(seconds: 1),
                                            behavior: SnackBarBehavior.floating,
                                            // margin: EdgeInsets.only(
                                            //   bottom: 80.0,
                                            // ),
                                            content: Text(
                                              "Removed Successfully",
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text("Yes"))
                                ],
                              );
                            },
                          );
                        },
                        child: ListTile(
                          title: Text(
                            // _playList[index].split('/').last,
                            _paths[index].split('/').last
                            ,
                            style:  TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFF100374),
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/icon.png'),
                          ),
                        ),
                      );
              },
            );
          }
        ),
      ),
    );
  }
}
