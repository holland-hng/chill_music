import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'publisher_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: PublisherEntity.typeId)
class PublisherEntity {
  static const int typeId = 1;
  @HiveField(0)
  late String? id;
  @HiveField(1)
  final String? bio;
  @HiveField(2)
  final String? avatar;
  @HiveField(3)
  final String? cover;
  @HiveField(4)
  final String? name;
  @HiveField(5)
  final String? sourceUrl;

  PublisherEntity({
    this.bio,
    this.avatar,
    this.cover,
    this.name,
    this.sourceUrl,
    this.id,
  });

  factory PublisherEntity.fromJson(Map<String, dynamic> json) =>
      _$PublisherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherEntityToJson(this);
}
