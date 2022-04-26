import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/model/model.dart';

import '../../main.dart';

class PlayListScreenInner extends StatefulWidget {
  String name;
  List<String> paths = [];

  PlayListScreenInner({
    Key? key,
    required this.name,
    required this.paths,
  }) : super(key: key);

  @override
  State<PlayListScreenInner> createState() => _PlayListScreenInnerState();
}

class _PlayListScreenInnerState extends State<PlayListScreenInner> {
  TextEditingController nameController = TextEditingController();
  List<String> _playList = [];
  List thumbs = [];

  bool isFavorite = true;
  var key;
  var boxPlaylist = Hive.box<PlayList>(playlistBox);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titletext: widget.name,
      ),
      body: Padding(
        padding:const EdgeInsets.only(top :10),
        child: ValueListenableBuilder(
          valueListenable: boxPlaylist.listenable(),
          builder: (BuildContext context, Box<PlayList> value, Widget? child) {
            List<PlayList> _playListNames = value.values.toList();

            return ListView.separated(

              separatorBuilder: (context, index){
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: widget.paths.length,
              itemBuilder: (BuildContext context, int index) {
                List<String>_pathList = _playListNames[index].playList;
                return widget.paths.isEmpty
                    ? const Center(
                        child: Text('data'),
                      )
                    : ListTile(
                        title: Text(
                          widget.paths[index].split('/').last,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        leading: const CircleAvatar(
                          radius: 30,
                          child: Center(
                            child:  Icon(
                              MyFlutterApp.play,
                            ),
                          ),
                        ),
                      );
              },
            );
          },
        ),
      ),
      // body: ListView.separated(
      //   separatorBuilder: (context, index) {
      //     return SizedBox(
      //       height: 10,
      //     );
      //   },
      //   itemCount: widget.paths.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     // List<String>_pathList = _playListNames[index].playList;
      //     return widget.paths.isEmpty
      //         ? const Center(
      //             child: Text('data'),
      //           )
      //         : ListTile(
      //             title: Text(
      //               widget.paths[index].split('/').last,
      //               style: const TextStyle(
      //                 fontFamily: 'Poppins',
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w400,
      //               ),
      //             ),
      //             leading: const CircleAvatar(
      //               radius: 30,
      //               child: Center(
      //                 child: Icon(
      //                   MyFlutterApp.play,
      //                 ),
      //               ),
      //             ),
      //           );
      //   },
      // ),
    );
  }
}
