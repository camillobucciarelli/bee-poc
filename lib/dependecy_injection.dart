import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependecy_injection.config.dart';

final injector = GetIt.I;

@InjectableInit()
void initInjector() async {
  $initGetIt(injector);
}

@module
abstract class ExternalPackage {

  @lazySingleton
  Dio get dio => Dio();
}
