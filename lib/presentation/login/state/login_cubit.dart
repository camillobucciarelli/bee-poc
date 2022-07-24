import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/create_token_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final CreateTokenUseCase _createTokenUseCase;

  LoginCubit(this._createTokenUseCase) : super(LoginInitial());

  Future<void> login(Map<String, Object?> credentials) async {
    final email = credentials['email'];
    final password = credentials['password'];
    emit(LoginLoading());
    if (email is String && password is String) {
      final result =
          await _createTokenUseCase(email: email, password: password);
      result.fold(
        (failure) => emit(LoginFailure()),
        (token) => emit(LoginSuccess()),
      );
    } else {
      emit(LoginFailure());
    }
  }
}
