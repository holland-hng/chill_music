import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:injectable/injectable.dart';
import 'home_service.dart';

@singleton
class HomeRepository {
  HomeService _service = HomeService();

  Future<List<PlaylistResponse>> fetchContent() async {
    return await _service.fetchHomeContent();
  }
}
