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
