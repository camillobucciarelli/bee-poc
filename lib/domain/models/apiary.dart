import 'package:equatable/equatable.dart';

import '../../data/entities/apiary_entity.dart';

class Apiary extends Equatable {
  final int id;
  final String name;
  final Map<String, Map<String, double?>> weightDeltas;

  const Apiary(
    this.id,
    this.name,
    this.weightDeltas,
  );

  factory Apiary.fromEntity(ApiaryEntity entity) {
    return Apiary(
      entity.id,
      entity.name,
      entity.weights.delta,
    );
  }

  int? getLastWeightMeasurementDate(int hiveId) {
    final notNullKeys = weightDeltas['$hiveId']
        ?.entries
        .where((entry) => entry.value != null)
        .map((entry) => entry.key)
        .toList();
    notNullKeys?.sort((a, b) => -a.compareTo(b));
    return notNullKeys?.first != null ? int.tryParse(notNullKeys!.first) : null;
  }

  double? getHiveWeight(int hiveId) {
    return weightDeltas['$hiveId']?['${getLastWeightMeasurementDate(hiveId)}'];
  }

  @override
  List<Object?> get props => [
        id,
        name,
        weightDeltas,
      ];
}
