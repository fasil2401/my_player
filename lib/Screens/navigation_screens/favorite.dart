import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/model/model.dart';

import '../../main.dart';

class FavoriteVideoList extends StatefulWidget {
  FavoriteVideoList({Key? key}) : super(key: key);

  @override
  State<FavoriteVideoList> createState() => _FavoriteVideoListState();
}

class _FavoriteVideoListState extends State<FavoriteVideoList> {
  final List<String> file_names = [
    'Big B (2007)',
    'Loudspeaker (2009)',
    'Traffic (2011)',
    'Ustad Hotel (2012)',
    'Thattathin Marayathu',
  ];

  final List<String> file_url = [
    'https://s3.scoopwhoop.com/anj/mallumovies/e0363123-b2a8-4f21-8631-e07c1754deb1.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/0b25042f-edc7-4653-bc17-db7646f2aaa1.jpg',
    'https://image.scoopwhoop.com/w620/s4.scoopwhoop.com/anj/mallumovies/630e247d-41d1-4e97-b3b9-334e20723bf2.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovie/e0e0dab4-8b50-4ea0-b821-ccf51b4a488f.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/185a4e22-ac62-4e85-af99-b4127cb35753.jpg',
  ];
  List<String> _pathList = [];
  List thumbs = [];
  List<String> viewList = [];

  var boxFavorites = Hive.box<Favorites>(favoriteBox);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'Favorites',
      ),

      body: ValueListenableBuilder(
          valueListenable: boxFavorites.listenable(),
          builder: (BuildContext context, Box<Favorites> value, Widget? child) {
            List<Favorites> videopaths = value.values.toList();
            print('ivde aanooov favorite videos  ${videopaths}');
            for (var i = 0; i < videopaths.length; i++) {
              _pathList.add(videopaths[i].favorite);
              thumbs.add(videopaths[i].thumb);
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
      // body: ListView.builder(
      //   itemCount: file_names.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return CustomListTileVideos(
      //         subtite: false, trailicon: true, index: index, text: file_names[index],url: file_url[index],);
      //   },
      // ),
    );
  }
}
