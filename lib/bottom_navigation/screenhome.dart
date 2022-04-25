import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/navigation_screens/folders.dart';
import 'package:my_player/Screens/navigation_screens/playlist.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/bottom_navigation/widgets/bottomnavigation.dart';
import 'package:my_player/main.dart';
import 'package:my_player/model/model.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../provider/search_files.dart';

class ScreenHome extends StatefulWidget {
   ScreenHome({
    Key? key,
  }) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<String> _pathList = [];
  List thumbs = [];
  var boxVideos = Hive.box<Videos>(videoBox);
  final _pages =  [
    FolderScreen(),
    // AllVideoList(),
    PlayListScreen(),
    FavoriteVideoList(),
    SettingsScreen(),

  ];
  Future getThumb() async {
    print(_pathList);
    // var listBox = boxVideos.values.toList();
    for (var i = 0; i < _pathList.length; i++) {
      var key = (await VideoThumbnail.thumbnailData(
        video: _pathList[i],
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 25,
      ));
      thumbs.add(key);
      setState(() {});
      print('hi ${_pathList[i]}');
      boxVideos.put(i, Videos(paths: _pathList[i], thumb: thumbs[i],fav:  false));

      // print(listBox[i]);
    }
  }
  Future getFiles() async {
    // await Permission.storage.request();
    final value = '.mp4,.mkv,.webm'
    // final value = '.mp4'
        .trim()
        .replaceAll(' ', '')
        .split(',');
    if (value.isEmpty) {
      return;
    }
    SearchFilesInStorage.searchInStorage(
      value,
          (List<String> data) {
        _pathList.clear();
        // print(data);
        setState(() {
          _pathList.addAll(data);
          // for (var i = 0; i < _pathList.length; i++) {
          //   List<String> folder = _pathList[i].split('/').toList();
          //   String name = folder[folder.length - 2];
          //   //  folderName.add(name);
          // }
          // folderNameFinal = folderName.toSet().toList();
          // folderNameFinal.remove('0');
          // pathListMain= _pathList;
        });
      },
          (error) {},
    );
  }

  Future  sychronise() async{
     getFiles();

  }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     sychronise();
//   }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     sychronise();
//   }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: ScreenHome.selectedIndexNotifier,
                builder: (BuildContext context, int updatedInddex, child) {
                  return _pages[updatedInddex];
                },
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavigationBar(),
              ),
            ],
          )),
    );
  }
}