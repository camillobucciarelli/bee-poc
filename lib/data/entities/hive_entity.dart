import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_entity.g.dart';

@JsonSerializable(createToJson: false)
class HiveEntity extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'main_image')
  final String mainImage;
  @JsonKey(name: 'queen_name')
  final String queenName;
  @JsonKey(name: 'queen_image')
  final String queenImage;

  const HiveEntity(
    this.id,
    this.name,
    this.mainImage,
    this.queenName,
    this.queenImage,
  );

  factory HiveEntity.fromJson(Map<String, dynamic> json) => _$HiveEntityFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        mainImage,
        queenName,
        queenImage,
      ];
}
