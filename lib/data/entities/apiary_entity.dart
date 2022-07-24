import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apiary_entity.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ApiaryEntity extends Equatable {
  final int id;
  final String name;
  final WeightEntity weights;

  const ApiaryEntity(
    this.id,
    this.name,
    this.weights,
  );

  factory ApiaryEntity.fromJson(Map<String, dynamic> json) {
    return _$ApiaryEntityFromJson(json);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        weights,
      ];
}

@JsonSerializable(createToJson: false)
class WeightEntity extends Equatable {
  final Map<String, Map<String, double?>> delta;

  const WeightEntity(this.delta);

  factory WeightEntity.fromJson(Map<String, dynamic> json) {
    return _$WeightEntityFromJson(json);
  }

  @override
  List<Object?> get props => [delta];
}
