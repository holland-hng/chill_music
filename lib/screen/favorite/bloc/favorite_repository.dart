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

  void addToFavoriteList(Map<String, dynamic> playlist) {
    _service.addToFavoritesList(playlist);
  }

  void removeFromFavorites(Map<String, dynamic> playlist) {
    _service.removePlaylistFromFavorites(playlist);
  }
}
