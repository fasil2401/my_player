// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideosAdapter extends TypeAdapter<Videos> {
  @override
  final int typeId = 0;

  @override
  Videos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Videos(
      paths: fields[0] as String,
      thumb: fields[1] as dynamic,
      fav: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Videos obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.paths)
      ..writeByte(1)
      ..write(obj.thumb)
      ..writeByte(2)
      ..write(obj.fav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavoritesAdapter extends TypeAdapter<Favorites> {
  @override
  final int typeId = 1;

  @override
  Favorites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favorites(
      favorite: fields[0] as String,
      thumb: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Favorites obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.favorite)
      ..writeByte(1)
      ..write(obj.thumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlayListAdapter extends TypeAdapter<PlayList> {
  @override
  final int typeId = 2;

  @override
  PlayList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayList(
      playList: (fields[1] as List).cast<String>(),
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlayList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.playList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlayListVideosAdapter extends TypeAdapter<PlayListVideos> {
  @override
  final int typeId = 3;

  @override
  PlayListVideos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayListVideos(
      path: fields[1] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlayListVideos obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayListVideosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
