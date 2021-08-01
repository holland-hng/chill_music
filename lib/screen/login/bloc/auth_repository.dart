import 'package:chill_music/core/database/init.dart';
import 'package:chill_music/entity/auth/auth_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  static const String _key = "AuthRepository";
  var _box = Hive.box(Database.hiveBoxName);
  AuthEntity? _authInfo;
  AuthEntity? get authInfo {
    return _authInfo;
  }

  AuthRepository() {
    _authInfo = _box.get(_key);
  }
  void save(AuthEntity? _authInfo) {
    this._authInfo = _authInfo;
    _box.put(_key, _authInfo);
  }
}
