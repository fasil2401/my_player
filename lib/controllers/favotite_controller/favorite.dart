import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player/model/model.dart';

import '../../Repository/favorite_repository/favorite_repository.dart';




class FavoriteController extends GetxController{


    final Box observableFavoriteBox = FavoriteRepository.getFavoritesBox();


    updatePlayListVideo({required PlayListVideos item}){

    observableFavoriteBox.add(item);
    
    update();
  }
  // updateThumb({required int index, required Videos thumb}){
  //   observablePlaylistVideoBox.putAt(index, thumb);
  //   update();
  // }
}