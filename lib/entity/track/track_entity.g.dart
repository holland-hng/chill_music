// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackEntityAdapter extends TypeAdapter<TrackEntity> {
  @override
  final int typeId = 3;

  @override
  TrackEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrackEntity(
      name: fields[0] as String?,
      timeline: fields[1] as String?,
      thumbnail: fields[2] as String?,
      author: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TrackEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.timeline)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
