import 'package:chill_music/entity/author/author_entity.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/entity/publisher/publisher_entity.dart';
import 'package:chill_music/entity/track/track_entity.dart';
import 'package:hive/hive.dart';
import 'source_entity.dart';
part 'playlist_entity.g.dart';

@HiveType(typeId: PlaylistEntity.typeId)
class PlaylistEntity {
  static const int typeId = 0;
  @HiveField(0)
  final String thumbnail;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final PublisherEntity publisher;
  @HiveField(3)
  final SourceEntity sources;
  @HiveField(4)
  final String id;
  late List<TrackEntity> tracks;
  late List<AuthorEntity> authors;

  PlaylistEntity({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.publisher,
    required this.sources,
    this.tracks = const [],
    this.authors = const [],
  });
}

class PlaylistAdapter {
  static PlaylistEntity createEntity({
    required PlaylistResponse playlist,
    required PlaylistDetailResponse detail,
    required SourceEntity source,
  }) {
    return PlaylistEntity(
      id: playlist.id ?? "",
      authors: [],
      publisher: playlist.publisher ?? PublisherEntity(),
      sources: source,
      thumbnail: playlist.thumbnail ?? "",
      title: playlist.title ?? "",
      tracks: detail.tracks ?? [],
    );
  }
}
