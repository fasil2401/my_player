import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:my_player/Screens/navigation_screens/navigation.dart';
import 'package:my_player/Screens/onboarding/widgets.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/bottom_navigation/screenhome.dart';
import 'package:my_player/main.dart';
import 'package:my_player/model/model.dart';
import 'package:my_player/provider/search_files.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class FetchingScreen extends StatefulWidget {
  FetchingScreen({Key? key}) : super(key: key);

  @override
  State<FetchingScreen> createState() => _FetchingScreenState();
}

class _FetchingScreenState extends State<FetchingScreen> {
  List<String> _pathList = [];
  List thumbs = [];
  var boxVideos = Hive.box<Videos>(videoBox);
  @override
  void initState() {
    getFiles();
    // synchronise();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //child: FloatingActionButton(onPressed: _navigateToFolderScreen),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF100374) ,),
                  strokeWidth: 4,
                ),
              ),
             const SizedBox(
                height: 20,
              ),
              Text(
                'Fetching videos from the storage',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.width * 0.046,
                ),
              )
            ],
          ),
        ),
      ),
    );
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
          getThumb();
        });
      },
      (error) {},
    );
  }

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
      await boxVideos.put(
          i, Videos(paths: _pathList[i], thumb: thumbs[i], fav: false));

      // print(listBox[i]);
    }
    Navigator.of(context)
    .pushReplacement(MaterialPageRoute(builder: (context) => ScreenHome(isSatrting: 'yes',)));
  }
}
