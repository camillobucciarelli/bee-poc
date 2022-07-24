import 'utils/web_client_configurations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final injector = GetIt.I;

@InjectableInit()
Future<void> initInjector() async {
  $initGetIt(injector);
}

@module
abstract class ExternalPackage {
  @Named(WebClients.defaultClient)
  Dio dio(LoggyDioInterceptor logInterceptor) =>
      Dio()..interceptors.add(logInterceptor);

  @Named(WebClients.authenticated)
  Dio dioAuthenticated(
    WebClientAuthenticationInterceptor authInterceptor,
    LoggyDioInterceptor logInterceptor,
  ) {
    return Dio()
      ..interceptors.addAll([
        authInterceptor,
        logInterceptor,
      ]);
  }

  LoggyDioInterceptor get logInterceptor => LoggyDioInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      );
}
