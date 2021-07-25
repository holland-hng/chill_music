import 'package:chill_music/entity/author/author_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/publisher/publisher_response.dart';
import 'package:chill_music/entity/track/track_reponse.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: PlaylistEntity.typeId)
class PlaylistEntity {
  static const int typeId = 0;
  @HiveType(typeId: 1)
  final String thumbnail;
  @HiveType(typeId: 2)
  final String title;
  @HiveType(typeId: 3)
  final PublisherResponse publisher;
  @HiveType(typeId: 4)
  final SourceResponse sources;
  @HiveType(typeId: 5)
  final List<TrackReponse> tracks;
  @HiveType(typeId: 6)
  final List<AuthorReponse> authors;

  PlaylistEntity({
    required this.thumbnail,
    required this.title,
    required this.publisher,
    required this.sources,
    required this.tracks,
    required this.authors,
  });
}
