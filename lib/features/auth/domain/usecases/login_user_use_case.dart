import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/core/common/entities/user.dart';
import 'package:prestamo_lite/features/auth/domain/repositories/auth_repository.dart';

class LoginUserUseCase {
  final AuthRepository repository;

  LoginUserUseCase({required this.repository});

  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await repository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
