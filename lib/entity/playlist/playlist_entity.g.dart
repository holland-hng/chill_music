// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaylistEntityAdapter extends TypeAdapter<PlaylistEntity> {
  @override
  final int typeId = 0;

  @override
  PlaylistEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistEntity(
      id: fields[4] as String,
      thumbnail: fields[0] as String,
      title: fields[1] as String,
      publisher: fields[2] as PublisherEntity,
      source: fields[3] as SourceEntity,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.thumbnail)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.source)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
