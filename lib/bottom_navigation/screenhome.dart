import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/navigation_screens/folders.dart';
import 'package:my_player/Screens/navigation_screens/playlist.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/bottom_navigation/widgets/bottomnavigation.dart';
import 'package:my_player/controllers/video_controller/video_controller.dart';
import 'package:my_player/main.dart';
import 'package:my_player/model/model.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../provider/search_files.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({
    Key? key,
  required this.isSatrting ,this.existPathList}) : super(key: key);

  List<String>?existPathList = [];
  String isSatrting;

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {

  final controller = Get.put(VideoController());
  List<String> _pathList = [];
  List thumbs = [];
  // var boxVideos = Hive.box<Videos>(videoBox);
  final _pages = [
    FolderScreen(),
    // AllVideoList(),
    PlayListScreen(),
    FavoriteVideoList(),
    SettingsScreen(),
  ];
  Future getFiles() async {
    build(context);
    print('Adding started');
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
      (List<String> data)async {
        _pathList.clear();
         _pathList.addAll(data);

        SyncList();
      },
      (error) {},
    );
  }

  Future getThumb() async {
    
    print(_pathList);
    // var listBox = boxVideos.values.toList();
    //  await boxVideos.clear();
    for (var i = 0; i < _pathList.length; i++) {
      var key = (await VideoThumbnail.thumbnailData(
        video: _pathList[i],
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 25,
      ));
      thumbs.add(key);
      // setState(() {});
      print('hi ${_pathList[i]}');

      // print(listBox[i]);
    }
    // SyncListThumb();
  }

  Future SyncList() async {

    // controller.clearBox();
    // await boxVideos.clear();
    for (var i = 0; i < _pathList.length; i++) {
      controller.updateVideo( index: i,path: Videos(paths: _pathList[i], thumb: null, fav: false));
    //   boxVideos.put(
    //       i, Videos(paths: _pathList[i], thumb: null, fav: false));
    }
    // getThumb();
  }
  //  Future SyncListThumb () async {
  //   // await boxVideos.clear();
  //   for (var i = 0; i < _pathList.length; i++) {
  //     boxVideos.put(
  //         i, Videos(paths: _pathList[i], thumb: thumbs[i], fav: false));
  //   }
  // //  setState(() {
     
  // //  });
  // }


  @override
  void initState() {
    // Sync();
    if (widget.isSatrting == 'yes') {
      getFiles();
    }
    
    // TODO: implement initState
    super.initState();
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
void Sync(){
  build(context);
  getFiles();
 
}
  @override
  Widget build(BuildContext context) {
    setState(() {
      restarting == false;
    });
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
  // @override
  // void dispose() {
  //   Sync();
  //   // TODO: implement dispose
  //   super.dispose();
  // }
}
