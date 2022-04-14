import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:my_player/main.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key, this.path, required this.name})
      : super(key: key);
  final String name;
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back)),
        elevation: 0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text(widget.name),
      ),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.file(
              widget.path,
              betterPlayerConfiguration: BetterPlayerConfiguration(
                  aspectRatio: 16 / 9, looping: false),
            ),
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