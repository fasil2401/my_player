import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Videos extends HiveObject {
  @HiveField(0)
  String paths;
  @HiveField(1)
  var thumb;
  @HiveField(2)
  bool? fav;
  Videos({required this.paths, required this.thumb, this.fav});
}

@HiveType(typeId: 1)
class Favorites extends HiveObject {
  @HiveField(0)
  String favorite;
  @HiveField(1)
  var thumb;
  Favorites({required this.favorite, required this.thumb});
}
