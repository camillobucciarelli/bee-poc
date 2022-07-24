import '../entities/auth/refresh_token_request.dart';
import '../entities/auth/verify_token_request.dart';
import '../../utils/web_client_configurations.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../environment.dart';
import '../entities/auth/create_token_request.dart';
import '../entities/auth/token_response.dart';

part 'auth_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class AuthDataSource {
  @factoryMethod
  factory AuthDataSource(@Named(WebClients.defaultClient) Dio dio) =>
      _AuthDataSource(dio, baseUrl: '${Env.baseUrl}/auth/jwt');

  @POST('/create')
  Future<TokenResponse> create(@Body() CreateTokenRequest request);

  @POST('/refresh')
  Future<TokenResponse> refresh(@Body() RefreshTokenRequest request);

  @POST('/verify')
  Future<void> verify(@Body() VerifyTokenRequest request);
}
