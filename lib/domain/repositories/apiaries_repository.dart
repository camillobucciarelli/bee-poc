import '../models/apiary.dart';
import 'package:dartz/dartz.dart';

abstract class ApiariesRepository {
  Future<Either<dynamic, List<Apiary>>> getApiaries();
}
