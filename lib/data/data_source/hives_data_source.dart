import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../environment.dart';
import '../../utils/web_client_configurations.dart';
import '../entities/hive_entity.dart';
import '../entities/paginated_list.dart';

part 'hives_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class HivesDataSource {
  @factoryMethod
  factory HivesDataSource(@Named(WebClients.authenticated) Dio dio) =>
      _HivesDataSource(dio, baseUrl: '${Env.baseUrl}/apiaries');

  @GET('/{apiary_id}/hives')
  Future<PaginatedList<HiveEntity>> getHives(@Path('apiary_id') int apiaryId);
}

PaginatedList<HiveEntity> deserializePaginatedList(Map<String, dynamic> json) =>
    PaginatedList.fromJson(json, HiveEntity.fromJson);
