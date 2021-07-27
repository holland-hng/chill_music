import 'package:hive/hive.dart';
part 'author_entity.g.dart';

@HiveType(typeId: AuthorEntity.typeId)
class AuthorEntity {
  static const int typeId = 4;
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? url;

  AuthorEntity({this.name, this.url});
}
