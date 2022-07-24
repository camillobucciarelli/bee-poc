import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/apiary.dart';
import '../../../domain/models/hive.dart';
import '../../../domain/use_cases/get_hives_use_case.dart';

part 'hives_state.dart';

@injectable
class HivesCubit extends Cubit<HivesState> {
  final GetHivesUseCase _getHivesUseCase;

  HivesCubit(this._getHivesUseCase) : super(const HivesLoading());

  Future<void> loadHivesIn(Apiary apiary) async {
    emit(const HivesLoading());
    final result = await _getHivesUseCase(apiary: apiary);
    result.fold(
      (failure) => emit(const HivesFailure()),
      (hives) => emit(HivesSuccess([...hives])),
    );
  }
}
