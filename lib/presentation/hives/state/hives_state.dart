part of 'hives_cubit.dart';

@immutable
abstract class HivesState extends Equatable {
  const HivesState();
}

class HivesLoading extends HivesState {
  const HivesLoading();

  @override
  List<Object?> get props => [];
}

class HivesFailure extends HivesState {
  final String message;

  const HivesFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class HivesSuccess extends HivesState {
  final List<Hive> hives;

  const HivesSuccess(this.hives);

  @override
  List<Object?> get props => [hives];
}
