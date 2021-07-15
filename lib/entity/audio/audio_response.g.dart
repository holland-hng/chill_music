// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioResponse _$AudioResponseFromJson(Map<String, dynamic> json) {
  return AudioResponse(
    id: json['id'] as String?,
    title: json['title'] as String?,
    listens: json['listens'] as int?,
    likes: json['likes'] as int?,
    thumbnail: json['thumbnail'] as String?,
    sourceUrl: json['source_url'] as String?,
    audioUrl: json['audio_url'] as String?,
  );
}

Map<String, dynamic> _$AudioResponseToJson(AudioResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'listens': instance.listens,
      'likes': instance.likes,
      'thumbnail': instance.thumbnail,
      'source_url': instance.sourceUrl,
      'audio_url': instance.audioUrl,
    };
