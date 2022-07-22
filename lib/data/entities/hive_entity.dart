import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_entity.g.dart';

@JsonSerializable(createToJson: false)
class HiveEntity extends Equatable {
  final int id;
  final String? name;
  @JsonKey(name: 'owner_name')
  final String? ownerName;
  @JsonKey(name: 'main_image')
  final String? mainImage;

  const HiveEntity(
    this.id,
    this.name,
    this.ownerName,
    this.mainImage,
  );

  factory HiveEntity.fromJson(Map<String, dynamic> json) => _$HiveEntityFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        ownerName,
        mainImage,
      ];
}
