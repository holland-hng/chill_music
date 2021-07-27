import 'package:chill_music/entity/author/author_entity.dart';
import 'package:chill_music/entity/playlist/playlist_entity.dart';
import 'package:chill_music/entity/playlist/source_entity.dart';
import 'package:chill_music/entity/publisher/publisher_entity.dart';
import 'package:chill_music/entity/track/track_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  static const hiveBoxName = 'ChillMusic';
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PlaylistEntityAdapter());
    Hive.registerAdapter(PublisherEntityAdapter());
    Hive.registerAdapter(SourceEntityAdapter());
    Hive.registerAdapter(AuthorEntityAdapter());
    Hive.registerAdapter(TrackEntityAdapter());
    await Hive.openBox(hiveBoxName);
  }
}
