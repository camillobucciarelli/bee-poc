import '../../domain/models/hive.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/hives_repository.dart';
import '../data_source/hives_data_source.dart';

@LazySingleton(as: HivesRepository)
class HivesRepositoryImpl extends HivesRepository {
  final HivesDataSource _hivesDataSource;

  HivesRepositoryImpl(this._hivesDataSource);

  @override
  Future<Either<dynamic, List<Hive>>> getHives(int apiaryId) async {
    try {
      final response = await _hivesDataSource.getHives(apiaryId);
      return right(response.results.map(Hive.fromEntity).toList());
    } catch (e) {
      return left(e);
    }
  }
}
