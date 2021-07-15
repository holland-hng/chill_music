import 'package:json_annotation/json_annotation.dart';
part 'audio_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AudioResponse {
  late String? id;
  final String? title;
  final int? listens;
  final int? likes;
  final String? thumbnail;
  final String? sourceUrl;
  final String? audioUrl;

  AudioResponse({
    this.id,
    this.title,
    this.listens,
    this.likes,
    this.thumbnail,
    this.sourceUrl,
    this.audioUrl,
  });
  factory AudioResponse.fromJson(Map<String, dynamic> json) =>
      _$AudioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AudioResponseToJson(this);
}
