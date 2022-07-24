import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_entity.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class HiveEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String externalId;

  const HiveEntity(
    this.id,
    this.name,
    this.imageUrl,
    this.externalId,
  );

  factory HiveEntity.fromJson(Map<String, dynamic> json) =>
      _$HiveEntityFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        externalId,
      ];
}
