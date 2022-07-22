import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../environment.dart';
import '../entities/hive_entity.dart';

part 'hives_data_source.g.dart';

@RestApi(baseUrl: Env.baseUrl)
@lazySingleton
abstract class HivesDataSource {

  @factoryMethod
  factory HivesDataSource(Dio dio) = _HivesDataSource;

  @GET('/hives')
  Future<List<HiveEntity>> getHives(@Query('honey_id') int honeyId);
}
