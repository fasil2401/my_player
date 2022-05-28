import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player/Repository/playlist_video_repository/play_list_video_repository.dart';
import 'package:my_player/model/model.dart';

class PlaylistVideoController extends GetxController {
  final Box observablePlaylistVideoBox =
      PlayListVideoRepository.getPlayListVideoBox();

  updatePlayListVideo(
      {required PlayListVideos item,
      required String playlist,
      required String path}) {
    List<String> recentlist = [];
    List<dynamic> _favlist = observablePlaylistVideoBox.values.toList();
    _favlist.forEach(
      (element) {
        if (element.id == playlist) {
          recentlist.add(element.path);
        } // recentlist.add(element.id);
      },
    );
    if (!recentlist.contains(path)) {
      observablePlaylistVideoBox.add(item);
    }
    update();
  }
  removePlaylistVideo({required String id , required String path}){
    List<PlayListVideos> currentlist = [];
    List<dynamic> alllist = observablePlaylistVideoBox.values.toList();
    alllist.forEach((element) {
      if(element.id == id){
        currentlist.add(element);
      }
     });
     final itemToRemove = currentlist.firstWhere((element) => element.path == path);
     itemToRemove.delete();
    
     update();
      Get.snackbar('', 'Reomoved', snackPosition: SnackPosition.TOP);
  }


  // updateThumb({required int index, required Videos thumb}){
  //   observablePlaylistVideoBox.putAt(index, thumb);
  //   update();
  // }
}
