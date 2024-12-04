import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/core/common/entities/user.dart';
import 'package:prestamo_lite/core/utils/random_id.dart';
import 'package:prestamo_lite/features/auth/domain/repositories/auth_repository.dart';

class SignWithEmailPasswordUseCase {
  final AuthRepository repository;

  SignWithEmailPasswordUseCase({
    required this.repository,
  });

  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    final user = User(
      id: randomId,
      name: params.name,
      email: params.email,
      password: params.password,
    );
    return repository.singUpWithEmailPassword(user);
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
