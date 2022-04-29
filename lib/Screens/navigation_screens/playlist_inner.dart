import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/playlist.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/bottom_navigation/screenhome.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/model/model.dart';

import '../../main.dart';

class PlayListScreenInner extends StatefulWidget {
  String name;
  List<String> paths = [];

  PlayListScreenInner({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<PlayListScreenInner> createState() => _PlayListScreenInnerState();
}

class _PlayListScreenInnerState extends State<PlayListScreenInner> {
  TextEditingController nameController = TextEditingController();
  List<String> _playList = [];

  bool isFavorite = true;
  var key;
  var boxPlaylist = Hive.box<PlayList>(playlistBox);
  var boxPlaylistVideo = Hive.box<PlayListVideos>(playlistVideoBox);
  @override
  void initState() {
    deleteSame();
    getVideos();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titletext: widget.name,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.separated(
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
                                name: _playList[index].split('/').last,
                                path: _playList[index].toString(),
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
                                    deletePlaylistVideo(
                                        _playList[index].toString());
                                    Navigator.of(context).pop();
                                    // Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PlayListScreenInner(
                                                name: widget.name),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        duration: Duration(seconds: 1),
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.only(
                                          bottom: 80.0,
                                        ),
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
                        _playList[index].split('/').last,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
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
        ),
      ),
    );
  }
 void deleteSame() {
   List<String> playlistvideo =[];
   List<String> videolist =[];
   List<PlayListVideos> _listFav = Hive.box<PlayListVideos>(playlistVideoBox).values.toList();
   List<Videos> _listVideo = Hive.box<Videos>(videoBox).values.toList();
   for (var i = 0; i < _listFav.length; i++) {
    playlistvideo.add(_listFav[i].path);
   }
   for (var i = 0; i < _listVideo.length; i++) {
     videolist.add(_listVideo[i].paths);
   }
   playlistvideo.forEach((element) { if (!videolist.contains(element)){
     deletevideo(element);
   }});
 }
  void deletevideo(String text) async {
    // await boxFavorite.delete(widget.Customkey);
    // final userToDelete =
    // await _userBox.values.firstWhere((element) => element.id == id);
    // await userToDelete.delete();
    final videotoremove = boxPlaylistVideo.values.firstWhere(
        (element) => element.path == text
        );
    await videotoremove.delete();
    
  }
  void getVideos() async {
    List<PlayListVideos> _list =
        Hive.box<PlayListVideos>(playlistVideoBox).values.toList();
    for (var i = 0; i < _list.length; i++) {
      if (_list[i].id.trim() == widget.name.trim()) {
        _playList.add(_list[i].path);
      }
    }
  }

  void deletePlaylistVideo(String thispath) async {
    final videotoremove = boxPlaylistVideo.values
        .firstWhere((element) => element.path == thispath);
    await videotoremove.delete();
    getVideos();
  }
}
