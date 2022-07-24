import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/use_cases/get_token_use_case.dart';

class WebClients {
  static const defaultClient = 'defaultClient';
  static const authenticated = 'authenticated';

  WebClients._();
}

@lazySingleton
class WebClientAuthenticationInterceptor extends InterceptorsWrapper {
  final GetTokenUseCase _getTokenUseCase;

  WebClientAuthenticationInterceptor(this._getTokenUseCase);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenResponse = await _getTokenUseCase();
    options.headers
        .putIfAbsent('Authorization', () => 'Bearer ${tokenResponse?.access}');
    super.onRequest(options, handler);
  }
}
