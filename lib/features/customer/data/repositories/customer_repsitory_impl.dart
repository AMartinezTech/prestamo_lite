import 'package:fpdart/fpdart.dart';
import 'package:prestamo_lite/core/error/exceptions.dart';
import 'package:prestamo_lite/core/error/failure.dart';
import 'package:prestamo_lite/features/customer/data/datasource/customer_local_datasource.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';

class CustomerRepsitoryImpl implements CustomerRepository {
  final CustomerLocalDataSource customerLocalDataSource;

  CustomerRepsitoryImpl({
    required this.customerLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Customer>>> getAllCustomer() async {
    try {
      final List<Customer> resp =
          await customerLocalDataSource.getAllCustomer();

      return right(resp);
    } on LocalException {
      return left(Failure("Error al buscar todos cliente"));
    }
  }

  @override
  Future<Either<Failure, Customer>> getCustomerById(int id) async {
    try {
      final resp = await customerLocalDataSource.getCustomerById(id);

      return right(resp);
    } on LocalException {
      return left(Failure("Error al buscar el cliente"));
    }
  }

  @override
  Future<Either<Failure, bool>> saveCustomer(Customer customer) async {
    try {
      final bool resp = await customerLocalDataSource.saveCustomer(customer);

      return right(resp);
    } on LocalException {
      return left(Failure("Error al guardar el cliente"));
    }
  }
}
