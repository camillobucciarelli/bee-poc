import 'package:equatable/equatable.dart';

import '../../data/entities/hive_entity.dart';

class Hive extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String? weight;
  final DateTime? measurementDate;
  final String externalId;

  String get externalIdToShow => externalId.substring(externalId.length - 6);

  const Hive({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.externalId,
    this.weight,
    this.measurementDate,
  });

  factory Hive.fromEntity(HiveEntity entity) {
    return Hive(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      externalId: entity.externalId,
    );
  }

  Hive copyWith({
    int? id,
    String? name,
    String? imageUrl,
    String? weight,
    DateTime? measurementDate,
    String? externalId,
  }) {
    return Hive(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      weight: weight ?? this.weight,
      measurementDate: measurementDate ?? this.measurementDate,
      externalId: externalId ?? this.externalId,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, imageUrl, externalId, weight, measurementDate];
}
