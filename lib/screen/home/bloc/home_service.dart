import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/entity/publisher/publisher_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  HomeService();
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('homePlaylists');

  Future<List<PlaylistResponse>> fetchHomeContent() async {
    List<PlaylistResponse> _playlists = [];
    QuerySnapshot _querySnapshot =
        await _ref.orderBy("priority", descending: true).get();
    _querySnapshot.docs.forEach((data) {
      String _id = "JtaJtf5FiLmXtOUvWdG6";
      try {
        _id = data["playlistId"];
      } catch (e) {}
      PlaylistResponse _playlist = PlaylistResponse(
        id: _id,
        title: data["title"],
        colorRaw: [
          data["color"][0],
          data["color"][1],
          data["color"][2],
        ],
        thumbnail: data["thumbnail"],
        publisher: PublisherEntity(name: data["author"]),
      );
      _playlists.add(_playlist);
    });
    return _playlists;
  }
}
