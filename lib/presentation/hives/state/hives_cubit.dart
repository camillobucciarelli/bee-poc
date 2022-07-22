import 'package:bee/domain/use_cases/get_hives_list_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/hive.dart';

part 'hives_state.dart';

@injectable
class HivesCubit extends Cubit<HivesState> {
  final GetHivesListUseCase _getHivesListUseCase;

  HivesCubit(this._getHivesListUseCase) : super(const HivesLoading());

  void getHives() async {
    final result = await _getHivesListUseCase(honeyId: 12);
    emit(result.fold(
      (failure) => HivesFailure(failure.toString()),
      (hives) => HivesSuccess(hives),
    ));
  }
}
