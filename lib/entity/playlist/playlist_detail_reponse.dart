import 'package:chill_music/entity/author/author_reponse.dart';
import 'package:chill_music/entity/track/track_reponse.dart';

class SourceResponse {
  final String? url128kpbs;
  final String? url320kpbs;

  SourceResponse({this.url128kpbs, this.url320kpbs});
}

class PlaylistDetailResponse {
  final List<TrackReponse>? tracks;
  final List<AuthorReponse>? authors;
  final SourceResponse? source;
  final String? thumbnail;

  PlaylistDetailResponse({
    this.thumbnail,
    this.tracks,
    this.authors,
    this.source,
  });
}
