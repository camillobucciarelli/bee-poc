import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/apiary.dart';
import '../../domain/repositories/apiaries_repository.dart';
import '../data_source/apiaries_data_source.dart';

@LazySingleton(as: ApiariesRepository)
class ApiariesRepositoryImpl extends ApiariesRepository {
  final ApiariesDataSource _apiariesDataSource;

  ApiariesRepositoryImpl(this._apiariesDataSource);

  @override
  Future<Either<dynamic, List<Apiary>>> getApiaries() async {
    try {
      final response = await _apiariesDataSource.getApiaries();
      return right(response.results.map(Apiary.fromEntity).toList());
    } catch (e) {
      return left(e);
    }
  }
}
