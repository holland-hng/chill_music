import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaylistRepository {
  final PlaylistService _service;

  PlaylistRepository(this._service);
  Future<PlaylistDetailResponse?> fetchConent(String playlistId) async {
    return await _service.fetchContent(playlistId);
  }
}
