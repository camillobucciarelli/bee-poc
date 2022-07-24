import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/apiary.dart';
import '../../../domain/use_cases/get_apiaries_use_case.dart';

part 'apiaries_state.dart';

@injectable
class ApiariesCubit extends Cubit<ApiariesState> {
  final GetApiariesUseCase _getApiariesUseCase;

  ApiariesCubit(this._getApiariesUseCase) : super(const ApiariesLoading());

  Future<void> loadApiaries() async {
    emit(const ApiariesLoading());
    final result = await _getApiariesUseCase.call();
    result.fold(
      (failure) => emit(const ApiariesFailure()),
      (apiaries) => emit(ApiariesSuccess(apiaries)),
    );
  }
}
