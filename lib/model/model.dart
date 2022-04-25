import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Videos extends HiveObject {
  @HiveField(0)
  String paths;
  @HiveField(1)
  var thumb;
  @HiveField(2)
  bool fav = false;
  Videos({required this.paths, required this.thumb, required this.fav});
}

@HiveType(typeId: 1)
class Favorites extends HiveObject{
  @HiveField(0)
  String favorite;
  @HiveField(1)
  var thumb;

  Favorites({required this.favorite, required this.thumb});
}

@HiveType(typeId: 2)
class PlayList extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<String>playList;

  PlayList({required this.playList, required this.name});
}
