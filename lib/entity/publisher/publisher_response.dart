import 'package:chill_music/entity/audio/audio_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'publisher_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PublisherResponse {
  late String? id;
  final String? bio;
  final String? avatar;
  final String? cover;
  final String? name;
  final String? sourceUrl;

  PublisherResponse({
    this.bio,
    this.avatar,
    this.cover,
    this.name,
    this.sourceUrl,
    this.id,
  });

  factory PublisherResponse.fromJson(Map<String, dynamic> json) =>
      _$PublisherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherResponseToJson(this);
}
