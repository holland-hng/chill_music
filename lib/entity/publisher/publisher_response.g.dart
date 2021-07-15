// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublisherResponse _$PublisherResponseFromJson(Map<String, dynamic> json) {
  return PublisherResponse(
    bio: json['bio'] as String?,
    avatar: json['avatar'] as String?,
    cover: json['cover'] as String?,
    name: json['name'] as String?,
    sourceUrl: json['source_url'] as String?,
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$PublisherResponseToJson(PublisherResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bio': instance.bio,
      'avatar': instance.avatar,
      'cover': instance.cover,
      'name': instance.name,
      'source_url': instance.sourceUrl,
    };
