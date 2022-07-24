import 'package:equatable/equatable.dart';

class Env extends Equatable {
  static const String baseUrl = 'https://api.3bee.com/api/v1';

  @override
  List<Object?> get props => [baseUrl];
}
