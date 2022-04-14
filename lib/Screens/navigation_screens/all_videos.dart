import 'package:flutter/material.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/main.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/model/model.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AllVideoList extends StatefulWidget {
  AllVideoList({Key? key}) : super(key: key);

  @override
  State<AllVideoList> createState() => _AllVideoListState();
}

class _AllVideoListState extends State<AllVideoList> {
  List<String> _pathList = [];
  List thumbs = [];
  List<String> viewList = [];
  var boxVideos = Hive.box<Videos>(videoBox);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'All videos',
      ),
      body: ValueListenableBuilder(
          valueListenable: boxVideos.listenable(),
          builder: (BuildContext context, Box<Videos> value, Widget? child) {
            List<Videos> videoPaths = value.values.toList();
            print('ivde aanooov all videos  ${videoPaths}');
            for (var i = 0; i < videoPaths.length; i++) {
              _pathList.add(videoPaths[i].paths);
              thumbs.add(videoPaths[i].thumb);
            }
            return ListView.builder(
              itemCount: _pathList.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomListTileVideos(
                  subtite: false,
                  trailicon: true,
                  index: index,
                  text: _pathList[index].split('/').last,
                  url: thumbs[index],
                  folderName: '',
                  pathList: _pathList,
                );
              },
            );
          }),
    );
  }
}
