import '../models/apiary.dart';
import '../repositories/apiaries_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetApiariesUseCase {
  final ApiariesRepository _apiariesRepository;

  GetApiariesUseCase(this._apiariesRepository);

  Future<Either<dynamic, List<Apiary>>> call() {
    return _apiariesRepository.getApiaries();
  }
}
