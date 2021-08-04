import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/entity/publisher/publisher_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavoriteService {
  late DocumentReference _ref = FirebaseFirestore.instance
      .collection('favorites')
      .doc("pIHcD1xDWBKDMpu5uhtN");

  Future<List<PlaylistResponse>> fetch() async {
    List<PlaylistResponse> _playlists = [];
    await _ref.get().then((doc) async {
      var _datas = doc["list"];
      for (int i = 0; i < _datas.length; i++) {
        var _data = _datas[i];
        _playlists.add(PlaylistResponse(
          id: _data["playlistId"],
          title: _data["title"],
          colorRaw: [
            _data["color"][0],
            _data["color"][1],
            _data["color"][2],
          ],
          thumbnail: _data["thumbnail"],
          publisher: PublisherEntity(name: _data["author"]),
        ));
      }
    });

    return _playlists;
  }

  void addToFavoritesList(Map<String, dynamic> playlist) {
    _ref.update({
      "list": FieldValue.arrayUnion([playlist])
    });
  }

  void removePlaylistFromFavorites(Map<String, dynamic> playlist) {
    _ref.update({
      "list": FieldValue.arrayRemove([playlist])
    });
  }
}
