part of 'hives_cubit.dart';

abstract class HivesState extends Equatable {
  const HivesState();
}

class HivesLoading extends HivesState {
  const HivesLoading();

  @override
  List<Object> get props => [];
}

class HivesFailure extends HivesState {
  const HivesFailure();

  @override
  List<Object> get props => [];
}

class HivesSuccess extends HivesState {
  final List<Hive> hives;

  const HivesSuccess(this.hives);

  @override
  List<Object> get props => [hives];
}
