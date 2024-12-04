import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/exceptions.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:prestamo_lite/core/common/entities/user.dart';
import 'package:prestamo_lite/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final resp = await authLocalDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );
      return right(resp);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> singUpWithEmailPassword(User user) async {
    try {
      final resp = await authLocalDataSource.signUpWithEmailPassword(user);

      return right(resp);
    } catch (e) {
      return left(
        Failure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await authLocalDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('Usuario no logeado!'));
      }
      return right(user);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }
}
