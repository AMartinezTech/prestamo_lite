import 'package:prestamo_lite/features/customer/data/datasource/local_datasource.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';

class CustomerRepsitoryImpl implements CustomerRepository {
  final LocalDataSource localDatasource;
  const CustomerRepsitoryImpl(this.localDatasource);

  @override
  List<Customer> getCustomers() {
    return localDatasource.getCustomers();
  }

  @override
  void createCustomer({
    required int id,
    required String name,
    required int qtyQuota,
    required double amountQuota,
  }) {
    localDatasource.createCustomer(
      id: id,
      name: name,
      qtyQuota: qtyQuota,
      amountQuota: amountQuota,
    );
  }

  @override
  void payment(int idCust) {
    // TODO: implement payment
  }
}
