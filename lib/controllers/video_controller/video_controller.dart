


import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player/model/model.dart';

import '../../Repository/video_repository/video_repository.dart';


class VideoController extends GetxController{


    final Box observableVideoBox = VideoRepository.getVideoBox();

    updateVideo({required int index, required Videos path}){
    observableVideoBox.putAt(index, path);
    update();
  }
  // updateThumb({required int index, required Videos thumb}){
  //   observableVideoBox.putAt(index, thumb);
  //   update();
  // }
}