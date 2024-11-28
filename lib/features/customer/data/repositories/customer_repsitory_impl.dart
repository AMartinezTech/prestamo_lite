import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/exceptions.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/customer/data/datasource/local_datasource.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';

class CustomerRepsitoryImpl implements CustomerRepository {
  final LocalDataSource localDatasource;
  const CustomerRepsitoryImpl(this.localDatasource);

  @override
  Either<Failure, Customer> createCustomer({
    required int id,
    required String name,
    required int qtyQuota,
    required double amountQuota,
  }) {
    try {
      final customer = localDatasource.createCustomer(
        id: id,
        name: name,
        qtyQuota: qtyQuota,
        amountQuota: amountQuota,
      );

      return right(customer);
    } on LocalException catch (e) {
      return left(Failure(e.message));
    }
  }
}
