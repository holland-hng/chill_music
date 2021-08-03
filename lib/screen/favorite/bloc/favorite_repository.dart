import 'package:chill_music/screen/favorite/bloc/favorite_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavoriteRepository {
  final FavoriteService _service;

  FavoriteRepository(this._service);
}
