import '../entities/auth/create_token_request.dart';
import '../entities/auth/refresh_token_request.dart';
import '../entities/auth/token_response.dart';
import '../entities/auth/verify_token_request.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<Either<dynamic, TokenResponse>> create(
      CreateTokenRequest request) async {
    try {
      final entity = await _authDataSource.create(request);
      return right(entity);
    } catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<dynamic, TokenResponse>> refresh(
      RefreshTokenRequest request) async {
    try {
      final entity = await _authDataSource.refresh(request);
      return right(entity);
    } catch (e) {
      return left(e);
    }
  }

  @override
  Future<bool> verify(VerifyTokenRequest request) async {
    try {
      await _authDataSource.verify(request);
      return true;
    } catch (e) {
      return false;
    }
  }
}
