import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

abstract interface class CustomerRepository {
  Either<Failure, Customer> createCustomer({
    required int id,
    required String name,
    required int qtyQuota,
    required double amountQuota,
  });
}
