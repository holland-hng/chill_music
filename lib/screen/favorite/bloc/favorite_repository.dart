import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/favorite/bloc/favorite_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavoriteRepository {
  final FavoriteService _service;

  FavoriteRepository(this._service);

  Future<List<PlaylistResponse>> fetchData() async {
    return await _service.fetch();
  }

  void addTofavoriteList(List<Map<String, dynamic>> playlists) {
    _service.addToFavoritesList(playlists);
  }
}
