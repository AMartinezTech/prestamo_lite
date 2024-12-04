import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/core/common/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> singUpWithEmailPassword(User user);

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
