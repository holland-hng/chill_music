import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/entity/publisher/publisher_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('homePlaylists');

  Future<List<PlaylistResponse>> fetchHomeContent() async {
    List<PlaylistResponse> _playlists = [];
    QuerySnapshot _querySnapshot =
        await _ref.orderBy("priority", descending: true).get();
    _querySnapshot.docs.forEach((_data) {
      String _id = "JtaJtf5FiLmXtOUvWdG6";
      try {
        _id = _data["playlistId"];
      } catch (e) {}
      PlaylistResponse _playlist = PlaylistResponse(
        id: _id,
        title: _data["title"],
        colorRaw: [
          _data["color"][0],
          _data["color"][1],
          _data["color"][2],
        ],
        thumbnail: _data["thumbnail"],
        publisher: PublisherEntity(name: _data["author"]),
      );
      _playlists.add(_playlist);
    });
    return _playlists;
  }
}
