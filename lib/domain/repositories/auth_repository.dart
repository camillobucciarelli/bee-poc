import '../../data/entities/auth/refresh_token_request.dart';
import '../../data/entities/auth/token_response.dart';
import '../../data/entities/auth/verify_token_request.dart';
import 'package:dartz/dartz.dart';

import '../../data/entities/auth/create_token_request.dart';

abstract class AuthRepository {
  Future<Either<dynamic, TokenResponse>> create(CreateTokenRequest request);

  Future<Either<dynamic, TokenResponse>> refresh(RefreshTokenRequest request);

  Future<bool> verify(VerifyTokenRequest request);
}
