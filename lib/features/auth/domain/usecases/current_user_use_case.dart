import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/common/entities/user.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/auth/domain/repositories/auth_repository.dart';

class CurrentUserUseCase {
  final AuthRepository authRepository;

  CurrentUserUseCase(this.authRepository);

  Future<Either<Failure, User>> call(NoPrams params) async {
    return await authRepository.currentUser();
  }
}

class NoPrams {}
