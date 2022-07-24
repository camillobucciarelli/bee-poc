import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/apiary.dart';
import '../models/hive.dart';
import '../repositories/hives_repository.dart';

@lazySingleton
class GetHivesUseCase {
  final HivesRepository _hivesRepository;

  GetHivesUseCase(this._hivesRepository);

  Future<Either<dynamic, List<Hive>>> call({required Apiary apiary}) async {
    final result = await _hivesRepository.getHives(apiary.id);
    return result.map((hives) {
      return hives.map((hive) {
        final timestamp = apiary.getLastWeightMeasurementDate(hive.id);
        final weight = apiary.getHiveWeight(hive.id);
        return hive.copyWith(
          measurementDate: timestamp != null
              ? DateTime.fromMillisecondsSinceEpoch(timestamp)
              : null,
          weight: weight?.toStringAsFixed(1) ?? '-',
        );
      }).toList();
    });
  }
}
