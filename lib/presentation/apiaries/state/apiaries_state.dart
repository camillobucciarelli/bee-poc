part of 'apiaries_cubit.dart';

abstract class ApiariesState extends Equatable {
  const ApiariesState();
}

class ApiariesLoading extends ApiariesState {
  const ApiariesLoading();

  @override
  List<Object> get props => [];
}

class ApiariesFailure extends ApiariesState {
  const ApiariesFailure();

  @override
  List<Object> get props => [];
}

class ApiariesSuccess extends ApiariesState {
  final List<Apiary> apiaries;

  const ApiariesSuccess(this.apiaries);

  @override
  List<Object> get props => [];
}
