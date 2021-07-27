import 'package:chill_music/core/database/init.dart';
import 'package:chill_music/entity/author/author_entity.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_entity.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/entity/playlist/source_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class LibraryRepository {
  static const String _key = "LibraryRepository";
  var _box = Hive.box(Database.hiveBoxName);
  late List<PlaylistEntity> _entities;

  LibraryRepository() {
    var _objects = _box.get(_key);
    _entities = [];
    if (_objects != null) {
      for (int i = 0; i < _objects.length; i++) {
        if (_objects[i] is PlaylistEntity) {
          _entities.add(_objects[i]);
        }
      }
    }
  }

  List<PlaylistEntity> getListPlaylist() {
    return _entities;
  }

  void add(
    PlaylistResponse playlist,
    PlaylistDetailResponse detail,
    SourceEntity source,
  ) {
    var _entity = PlaylistAdapter.createEntity(
      playlist: playlist,
      detail: detail,
      source: source,
    );
    _entities.add(_entity);
    _box.put(_key, _entities);
  }
}
