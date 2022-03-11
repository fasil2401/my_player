import 'package:flutter/material.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/navigation_screens/folders.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';

enum TabItem { folder, allVideos, favorite, settings }

Map<TabItem, String> tabName = {
  TabItem.folder: 'folder',
  TabItem.allVideos: 'all',
  TabItem.favorite: 'favorite',
  TabItem.settings: 'settings',
};
Map<TabItem, IconData> tabIcon = {
  TabItem.folder: MyFlutterApp.folder_1,
  TabItem.allVideos: MyFlutterApp.video_library,
  TabItem.favorite: MyFlutterApp.heart,
  TabItem.settings: MyFlutterApp.cog_outline,
};
Map<TabItem, Widget> roots ={
  TabItem.folder: FolderScreen(),
  TabItem.allVideos: AllVideoList(),
  TabItem.favorite: FavoriteVideoList(),
  TabItem.settings:const SettingsScreen(),
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.folder: Colors.red,
  TabItem.allVideos: Colors.green,
  TabItem.favorite: Colors.blue,
  TabItem.settings: Colors.purple,
};