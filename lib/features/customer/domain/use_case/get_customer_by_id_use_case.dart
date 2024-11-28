import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';

import '../entities/customer.dart';

class GetCustomerByIdUseCase {
  final CustomerRepository repository;

  GetCustomerByIdUseCase({required this.repository});

  Future<Either<Failure, Customer>> call(int id) {
    return repository.getCustomerById(id);
  }
}
