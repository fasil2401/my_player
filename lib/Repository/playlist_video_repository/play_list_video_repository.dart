

import 'package:hive_flutter/hive_flutter.dart';

import '../../model/model.dart';


class PlayListVideoRepository{
  static const playlistVideoBox = 'boxPlaylistVideo';

  
  static openPlayListVideoBox() async => await Hive.openBox<PlayListVideos>(playlistVideoBox);

  static Box getPlayListVideoBox() => Hive.box<PlayListVideos>(playlistVideoBox);

  static closePlayListVideoBox() async => await Hive.box(playlistVideoBox).close(); 
}