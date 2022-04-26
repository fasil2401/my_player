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
  late BetterPlayerController _betterPlayerController;
  GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    const BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            fit: BoxFit.contain,
            aspectRatio: 16 / 9,
            looping: false,
            autoDispose: true,
            handleLifecycle: true,
            
            controlsConfiguration: BetterPlayerControlsConfiguration(
                playerTheme: BetterPlayerTheme.cupertino));
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      
      BetterPlayerDataSourceType.file,
      widget.path,
      notificationConfiguration: BetterPlayerNotificationConfiguration(
        title: widget.name,
        imageUrl: 'https://images.hdqwalls.com/download/butterfly-on-rocks-4k-s1-1920x1080.jpg',
        showNotification: true,
      )
    );
  _betterPlayerController =BetterPlayerController(betterPlayerConfiguration);
  _betterPlayerController.setupDataSource(dataSource);
  _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
  _betterPlayerController.enablePictureInPicture(_betterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text(widget.name),
      ),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(
              controller: _betterPlayerController,
              key: _betterPlayerKey,
              // betterPlayerConfiguration: const BetterPlayerConfiguration(
              //     aspectRatio: 16 / 9,
              //     looping: false,
              //     autoDispose: true,
              //     controlsConfiguration: BetterPlayerControlsConfiguration(
              //         playerTheme: BetterPlayerTheme.cupertino)),
            ),
          
          ),
        ),
      ),
    );
  }
}
