import 'package:chill_music/entity/author/author_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/track/track_reponse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class PlaylistService {
  CollectionReference _ref = FirebaseFirestore.instance.collection('playlists');

  Future<PlaylistDetailResponse?> fetchContent(String playlistId) async {
    List<AuthorReponse> _authors = [];
    List<TrackReponse> _tracks = [];
    PlaylistDetailResponse? _result =
        PlaylistDetailResponse(authors: [], tracks: []);
    if (playlistId.length == 0) {
      return _result;
    }
    try {
      DocumentSnapshot data = await _ref.doc(playlistId).get();
      for (int i = 0; i < data["tracklist"].length; i++) {
        var _info = data["tracklist"][i];
        var _track = TrackReponse(
          thumbnail: _info["thumbnail"],
          name: _info["name"],
          timeline: _info["timeline"],
          author: _info["author"],
        );
        _tracks.add(_track);
      }
      for (int i = 0; i < data["Support the beatmakers"].length; i++) {
        var _info = data["Support the beatmakers"][i];
        var _author = AuthorReponse(
          name: _info["name"],
          url: _info["url"],
        );
        _authors.add(_author);
      }
      SourceResponse _source = SourceResponse(
        url128kpbs: data["url"]["128kpbs"],
        url320kpbs: data["url"]["320kpbs"],
      );
      _result = PlaylistDetailResponse(
        tracks: _tracks,
        authors: _authors,
        source: _source,
        thumbnail: data["thumbnail"],
      );
    } catch (e) {
      print("ERROR fetch playlist $playlistId: $e");
    }
    return _result;
  }
}
