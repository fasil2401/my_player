import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player/model/model.dart';

import '../../Repository/playlist_repository/playlist_repository.dart';



class PlaylistController extends GetxController{


    final Box observablePlaylistBox = PlayListRepository.getPlayListBox();

    updatePlayList({required PlayList item}){
    observablePlaylistBox.add(item);
    update();
  }
  // updateThumb({required int index, required Videos thumb}){
  //   observablePlaylistVideoBox.putAt(index, thumb);
  //   update();
  // }
}