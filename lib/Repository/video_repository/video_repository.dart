

import 'package:hive_flutter/hive_flutter.dart';

import '../../model/model.dart';


class VideoRepository{
  static const videoBox = 'boxVideos';

  
  static openVideoBox() async => await Hive.openBox<Videos>(videoBox);

  static Box getVideoBox() => Hive.box<Videos>(videoBox);

  static closeVideoBox() async => await Hive.box(videoBox).close(); 
}