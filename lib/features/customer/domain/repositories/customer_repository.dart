import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

abstract interface class CustomerRepository {
  void createCustomer({
    required int id,
    required String name,
    required int qtyQuota,
    required double amountQuota,
  });

  List<Customer> getCustomers();

  void payment(int idCust);
}
