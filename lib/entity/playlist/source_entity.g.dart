// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceEntityAdapter extends TypeAdapter<SourceEntity> {
  @override
  final int typeId = 2;

  @override
  SourceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourceEntity(
      url128kpbs: fields[0] as String?,
      url320kpbs: fields[1] as String?,
      path: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SourceEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url128kpbs)
      ..writeByte(1)
      ..write(obj.url320kpbs)
      ..writeByte(2)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
