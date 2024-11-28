import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';

class SaveCustomerUseCase {
  final CustomerRepository repository;

  SaveCustomerUseCase({required this.repository});

  Future<Either<Failure, bool>> call(Customer customer) {
    return repository.saveCustomer(customer);
  }
}
