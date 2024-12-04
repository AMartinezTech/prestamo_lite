import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';

class GetAllCustomerUseCase {
  final CustomerRepository repository;

  GetAllCustomerUseCase({required this.repository});

  Future<Either<Failure, List<Customer>>> call() async {
    return await repository.getAllCustomer();
  }
}
