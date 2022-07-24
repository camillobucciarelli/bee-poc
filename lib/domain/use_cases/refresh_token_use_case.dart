import '../../data/entities/auth/token_response.dart';
import 'package:injectable/injectable.dart';

import '../../data/entities/auth/refresh_token_request.dart';
import '../../dependency_injection.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class RefreshTokenUseCase {
  final AuthRepository _authRepository;

  RefreshTokenUseCase(this._authRepository);

  Future<TokenResponse?> call(String refreshToken) async {
    final result =
        await _authRepository.refresh(RefreshTokenRequest(refreshToken));
    return result.fold(
      (l) => null,
      (r) {
        injector.registerSingleton<TokenResponse>(r);
        return r;
      },
    );
  }
}
