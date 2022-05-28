import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_player/model/model.dart';

import '../../Repository/favorite_repository/favorite_repository.dart';
import '../../icons/my_flutter_app_icons.dart';

class FavoriteController extends GetxController {
  final Box observableFavoriteBox = FavoriteRepository.getFavoritesBox();

  updateFavorites({required Favorites item, required String path}) {
    List<String> recentlist = [];
    List<dynamic> _favlist = observableFavoriteBox.values.toList();
    
    _favlist.forEach((element) {
      recentlist.add(element.favorite);
    });
    // observableFavoriteBox.add(item);
if (!recentlist.contains(item.favorite)) {
      observableFavoriteBox.add(item);
      Get.snackbar('', 'Added to favorites', snackPosition: SnackPosition.TOP);
      update();
    }
    else{
      final itemtoRemove = observableFavoriteBox.values.firstWhere((element) => element.favorite == path);
      itemtoRemove.delete();
      update();
      Get.snackbar('', 'Reomoved', snackPosition: SnackPosition.TOP);
    }

    
  }

  IconData updateIcon({required String name}) {
    List<String> inlist = [];
    List<dynamic> _checklist = observableFavoriteBox.values.toList();
    _checklist.forEach((element) {
      inlist.add(element.title);
    });
    if (inlist.contains(name)) {
      return MyFlutterApp.heart;
    } else {
      return MyFlutterApp.heart_empty;
    }
  }
  // updateThumb({required int index, required Videos thumb}){
  //   observablePlaylistVideoBox.putAt(index, thumb);
  //   update();
  // }
}
