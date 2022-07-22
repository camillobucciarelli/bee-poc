import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/hive.dart';
import '../repositories/hives_repository.dart';

@lazySingleton
class GetHivesListUseCase {
  final HivesRepository _hivesRepository;

  GetHivesListUseCase(this._hivesRepository);

  Future<Either<dynamic, List<Hive>>> call({required int honeyId}) async {
    return await _hivesRepository.getHives(honeyId);
  }
}
