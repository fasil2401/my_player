import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player/Repository/playlist_video_repository/play_list_video_repository.dart';
import 'package:my_player/model/model.dart';



class PlaylistVideoController extends GetxController{


    final Box observablePlaylistVideoBox = PlayListVideoRepository.getPlayListVideoBox();

    updatePlayListVideo({required PlayListVideos item}){
    observablePlaylistVideoBox.add(item);
    update();
  }
  // updateThumb({required int index, required Videos thumb}){
  //   observablePlaylistVideoBox.putAt(index, thumb);
  //   update();
  // }
}