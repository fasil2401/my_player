import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Videos extends HiveObject {
  @HiveField(0)
  List<String> paths;

  Videos({required this.paths});
}

@HiveType(typeId: 1)
class Favorites extends HiveObject {
  
  
  @HiveField(0)
  String favorite;

  Favorites({required this.favorite});
}