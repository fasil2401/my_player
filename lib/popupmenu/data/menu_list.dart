import 'package:flutter/material.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';
import 'package:my_player/popupmenu/model/menu_item.dart';

class MenuListItems {
  static const List<MenuItem> itemFirst = [itemFavorite, itemShare];

  // static const List<MenuItem> itemSecond = [
  //   itemSignOut,
  // ];

  static const itemFavorite = MenuItem(
    modeltext: 'Add to Favorites',
    icon: MyFlutterApp.heart_empty, 
    selectedIcon: MyFlutterApp.heart, 
    selectedtext: 'Remove from Favorites',
    
  );

  static const itemShare = MenuItem(
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
