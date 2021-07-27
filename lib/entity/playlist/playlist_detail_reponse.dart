import 'package:chill_music/entity/author/author_entity.dart';
import 'package:chill_music/entity/track/track_entity.dart';

import 'source_entity.dart';

class PlaylistDetailResponse {
  final List<TrackEntity>? tracks;
  final List<AuthorEntity>? authors;
  final SourceEntity? source;
  final String? thumbnail;

  PlaylistDetailResponse({
    this.thumbnail,
    this.tracks,
    this.authors,
    this.source,
  });
}
