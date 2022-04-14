import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/navigation_screens/folders.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/bottom_navigation/widgets/bottomnavigation.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({
    Key? key,
  }) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages =  [
    FolderScreen(),
    AllVideoList(),
    FavoriteVideoList(),
    SettingsScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: selectedIndexNotifier,
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