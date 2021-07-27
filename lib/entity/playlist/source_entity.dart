import 'package:hive/hive.dart';
part 'source_entity.g.dart';

@HiveType(typeId: SourceEntity.typeId)
class SourceEntity {
  static const int typeId = 2;
  @HiveField(0)
  final String? url128kpbs;
  @HiveField(1)
  final String? url320kpbs;
  @HiveField(2)
  final String? path;
  SourceEntity({
    this.url128kpbs,
    this.url320kpbs,
    this.path,
  });
}
