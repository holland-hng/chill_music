import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryResponse {
  late String? id;
  final String? title;

  final List<PlaylistResponse>? playlists;

  CategoryResponse({
    this.title,
    this.playlists,
    this.id,
  });
}
