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

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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

  // void synchronise() async {
  //   await getFiles();
  //   // print(_pathList);
  //   // boxVideos.put(1,Videos(paths: _pathList));
  //   var listBox = boxVideos.values.toList();
  //   for (var i = 0; i < _pathList.length; i++) {
  //     print('hi ${_pathList[i]}');
  //     boxVideos.add(Videos(paths: _pathList[i]));
  //     print(listBox[i]);
  //   }
  // }

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

  final _controller = PageController();
  int _currentPage = 0;

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF293241),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/onboard_backg (2).png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _controller,
              itemCount: splashData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    onBoardingImage(context, index),
                    const Spacer(),
                    onBoardingText(context, index),
                  ],
                );
              },
              onPageChanged: (value) => setState(() => _currentPage = value),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      height: 62,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: onBoardButton(context),
                    ),
                  ),
                  const Spacer(),
                ],
              ))
        ],
      ),
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
      boxVideos.put(i, Videos(paths: _pathList[i], thumb: thumbs[i],fav:  false));

      // print(listBox[i]);
    }
  }

  ElevatedButton onBoardButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        _currentPage + 1 == splashData.length
            ? onBoard(context)
            : _controller.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
        if (_currentPage + 1 == splashData.length) {}
      },
      child: Text(
        _currentPage + 1 == splashData.length ? 'Go to app' : 'Next',
        style: const TextStyle(
          fontSize: 26,
          fontFamily: "Poppins",
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF7E9FDC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }

  onBoard(BuildContext ctx) async {
    await getThumb();
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setBool(first_time, true);
    Navigator.of(ctx)
        .pushReplacement(MaterialPageRoute(builder: (context) => ScreenHome()));
  }
}
