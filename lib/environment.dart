import 'package:equatable/equatable.dart';

class Env extends Equatable {
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

  static const String baseUrl = 'https://uag8qn45g9.execute-api.eu-central-1.amazonaws.com/$env/v2';

  @override
  List<Object?> get props => [env, baseUrl];
}
