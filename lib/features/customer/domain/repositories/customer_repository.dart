import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

abstract interface class CustomerRepository {
  Future<Either<Failure, Customer>> getCustomerById(int id);
  Future<Either<Failure, List<Customer>>> getAllCustomer();
  Future<Either<Failure, bool>> saveCustomer(Customer customer);
}
