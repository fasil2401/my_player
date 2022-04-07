import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key, this.path}) : super(key: key);

  final path;
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  // late BetterPlayerController _betterPlayerController;
  // @override
  // void initState() {
  //   BetterPlayerConfiguration betterPlayerConfiguration =
  //       BetterPlayerConfiguration(
  //     aspectRatio: 16 / 9,
  //     fit: BoxFit.contain,
  //   );
  //     _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
  //   _setupDataSource();
  //   super.initState();
  // }
  // void _setupDataSource() async {
  //   var filePath = await Utils.getFileUrl(Constants.fileTestVideoUrl);
  //   File file = File(filePath);

  //   List<int> bytes = file.readAsBytesSync().buffer.asUint8List();
  //   BetterPlayerDataSource dataSource =
  //       BetterPlayerDataSource.file("assets/videos/video.mp4");
  //   _betterPlayerController.setupDataSource(dataSource);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            //  child: BetterPlayer(controller: _betterPlayerController),
            child: BetterPlayer.file(
              widget.path,
              // ignore: prefer_const_constructors
              betterPlayerConfiguration: BetterPlayerConfiguration(

                  autoDetectFullscreenAspectRatio: true,
                  
                  // aspectRatio: 16 / 9,
                  autoPlay: true,
                  // fullScreenByDefault: true,
                  looping: true),
            ),
            // child: BetterPlayer.network(
            //   "https://www.appsloveworld.com/wp-content/uploads/2018/10/640.mp4 ", // ignore: prefer_const_constructors
            //   // ignore: prefer_const_constructors
            //   betterPlayerConfiguration: BetterPlayerConfiguration(
            //     aspectRatio: 16 / 9,
            //     autoPlay: true,
            //     fullScreenByDefault: true,
            //     looping: true
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
// class Constants{
//   static const String fileTestVideoUrl = "video.mp4";
//   // static const String fileTestVideoEncryptUrl = "video_encrypt.mp4";
// }

// class Utils {
//   static Future<String> getFileUrl(String fileName) async {
//     final directory = await getApplicationDocumentsDirectory();
//     return "${directory.path}/$fileName";
//   }
// }