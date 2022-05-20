import 'package:flutter/material.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';

import '../model/menu_item.dart';


class MenuListItems {
  static const List<MenuItems> itemFirst = [itemFavorite, itemShare, itemPLaylist];

  // static const List<MenuItem> itemSecond = [
  //   itemSignOut,
  // ];

  static const itemFavorite = MenuItems(
    modeltext: 'Add to Favorites',
    icon: MyFlutterApp.heart_empty, 
    selectedIcon: MyFlutterApp.heart, 
    selectedtext: 'Remove from Favorites',
    
  );
  
  static const itemPLaylist = MenuItems(
    modeltext: 'Add to Playlist',
    icon: MyFlutterApp.video_library, 
    selectedIcon: MyFlutterApp.video_library,
    selectedtext: 'Add to Playlist',
  );
   static const itemShare = MenuItems(
    modeltext: 'Share',
    icon: Icons.share, 
    selectedIcon: Icons.share, 
    selectedtext: 'Share',
  );



  // static const itemSignOut = MenuItem(
  //   modeltext: 'Delete',
  //   icon: MyFlutterApp.trash_empty,
  // );
}
