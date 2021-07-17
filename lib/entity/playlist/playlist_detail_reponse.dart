import 'package:chill_music/entity/author/author_reponse.dart';
import 'package:chill_music/entity/track/track_reponse.dart';

class PlaylistDetailResponse {
  final List<TrackReponse>? tracks;
  final List<AuthorReponse>? authors;

  PlaylistDetailResponse({this.tracks, this.authors});
}
