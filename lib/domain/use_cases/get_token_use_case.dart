import '../../data/entities/auth/token_response.dart';
import '../../dependency_injection.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTokenUseCase {
  Future<TokenResponse?> call() async {
    if (injector.isRegistered<TokenResponse>()) {
      return injector.get<TokenResponse>();
    }
    return null;
  }
}
