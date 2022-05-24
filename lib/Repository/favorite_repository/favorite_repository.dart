

import 'package:hive_flutter/hive_flutter.dart';

import '../../model/model.dart';


class FavoriteRepository{
  static const favoriteBox = 'boxFavorites';

  
  static openFavoritesBox() async => await Hive.openBox<Favorites>(favoriteBox);

  static Box getFavoritesBox() => Hive.box<Favorites>(favoriteBox);

  static closeFavoritesBox() async => await Hive.box(favoriteBox).close(); 
}