import 'package:dartz/dartz.dart';

import '../models/hive.dart';

abstract class HivesRepository {
  Future<Either<dynamic, List<Hive>>> getHives(int apiaryId);
}
