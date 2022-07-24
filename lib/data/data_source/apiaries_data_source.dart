import '../entities/apiary_entity.dart';
import '../entities/paginated_list.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../environment.dart';
import '../../utils/web_client_configurations.dart';

part 'apiaries_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class ApiariesDataSource {
  @factoryMethod
  factory ApiariesDataSource(@Named(WebClients.authenticated) Dio dio) =>
      _ApiariesDataSource(dio, baseUrl: '${Env.baseUrl}/apiaries');

  @GET('')
  Future<PaginatedList<ApiaryEntity>> getApiaries();
}

PaginatedList<ApiaryEntity> deserializePaginatedList(
        Map<String, dynamic> json) =>
    PaginatedList.fromJson(json, ApiaryEntity.fromJson);
