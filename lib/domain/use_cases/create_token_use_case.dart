import '../../data/entities/auth/token_response.dart';
import '../../dependency_injection.dart';
import '../repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/entities/auth/create_token_request.dart';

@lazySingleton
class CreateTokenUseCase {
  final AuthRepository _authRepository;

  CreateTokenUseCase(this._authRepository);

  Future<Either<dynamic, void>> call(
      {required String email, required String password}) async {
    final result =
        await _authRepository.create(CreateTokenRequest(email, password));
    return result.fold(
      left,
      (r) {
        if (injector.isRegistered<TokenResponse>()) {
          injector.unregister<TokenResponse>();
        }
        injector.registerSingleton<TokenResponse>(r);
        return right(null);
      },
    );
  }
}
