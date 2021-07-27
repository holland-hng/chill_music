// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PublisherEntityAdapter extends TypeAdapter<PublisherEntity> {
  @override
  final int typeId = 1;

  @override
  PublisherEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PublisherEntity(
      bio: fields[1] as String?,
      avatar: fields[2] as String?,
      cover: fields[3] as String?,
      name: fields[4] as String?,
      sourceUrl: fields[5] as String?,
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PublisherEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bio)
      ..writeByte(2)
      ..write(obj.avatar)
      ..writeByte(3)
      ..write(obj.cover)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.sourceUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublisherEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublisherEntity _$PublisherEntityFromJson(Map<String, dynamic> json) {
  return PublisherEntity(
    bio: json['bio'] as String?,
    avatar: json['avatar'] as String?,
    cover: json['cover'] as String?,
    name: json['name'] as String?,
    sourceUrl: json['source_url'] as String?,
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$PublisherEntityToJson(PublisherEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bio': instance.bio,
      'avatar': instance.avatar,
      'cover': instance.cover,
      'name': instance.name,
      'source_url': instance.sourceUrl,
    };
