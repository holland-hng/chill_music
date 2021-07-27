import 'package:hive/hive.dart';
part 'track_entity.g.dart';

@HiveType(typeId: TrackEntity.typeId)
class TrackEntity {
  static const int typeId = 3;
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? timeline;
  @HiveField(2)
  final String? thumbnail;
  @HiveField(3)
  final String? author;

  TrackEntity({
    this.name,
    this.timeline,
    this.thumbnail,
    this.author,
  });
}
