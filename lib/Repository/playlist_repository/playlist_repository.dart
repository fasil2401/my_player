

import 'package:hive_flutter/hive_flutter.dart';

import '../../model/model.dart';


class PlayListRepository{
  static const playlistBox = 'boxPlaylist';

  
  static openPlayListBox() async => await Hive.openBox<PlayList>(playlistBox);

  static Box getPlayListBox() => Hive.box<PlayList>(playlistBox);

  static closePlayListBox() async => await Hive.box(playlistBox).close(); 
}