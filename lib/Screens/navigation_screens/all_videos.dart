import 'package:flutter/material.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/main.dart';

class AllVideoList extends StatelessWidget {
   AllVideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'All videos',
      ),
      body: ListView.builder(
        itemCount: pathListMain.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomListTileVideos(
             subtite: false, trailicon: true, index: index, text: pathListMain[index],url:'', folderName: '', pathList: pathListMain,);
        },
      ),
    );
  }
}
