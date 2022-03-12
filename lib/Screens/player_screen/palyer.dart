import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            // child: BetterPlayer.file("assets/videos/Bheeshma Parvam Trailer _ Mammootty _ Amal Neerad _ Anend C Chandran _ Sushin Shyam _ Vivek Harshan.mp4",
            //  // ignore: prefer_const_constructors
            //   betterPlayerConfiguration: BetterPlayerConfiguration(
            //     aspectRatio: 16 / 9,
            //   ),
            // ),
            child: BetterPlayer.network(
              "https://www.appsloveworld.com/wp-content/uploads/2018/10/640.mp4 ", // ignore: prefer_const_constructors
              // ignore: prefer_const_constructors
              betterPlayerConfiguration: BetterPlayerConfiguration(
                aspectRatio: 16 / 9,
                autoPlay: true,
                fullScreenByDefault: true,
                looping: true
              ),
            ),
          ),
        ),
      ),
    );
  }
}
