import 'package:hive/hive.dart';
part 'auth_entity.g.dart';

@HiveType(typeId: AuthEntity.typeId)
class AuthEntity {
  static const int typeId = 5;
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? id;
  @HiveField(2)
  final String? avatar;

  AuthEntity(this.name, this.id, this.avatar);
}
