import 'package:prestamo_lite/features/customer/data/models/customer_model.dart';

abstract interface class LocalDataSource {
  void createCustomer({
    required int id,
    required String name,
    required int qtyQuota,
    required double amountQuota,
  });

  List<CustomerModel> getCustomers();
}

class LocalDatasourceImpl implements LocalDataSource {
  final List<CustomerModel> customerData;

  LocalDatasourceImpl({required this.customerData});

  @override
  List<CustomerModel> getCustomers() {
    return customerData;
  }

  @override
  void createCustomer({
    required int id,
    required String name,
    required int qtyQuota,
    required double amountQuota,
  }) {
    CustomerModel newCust = CustomerModel(
      id: id,
      name: name,
      qtyQuota: qtyQuota,
      amountQuota: amountQuota,
    );
    customerData.add(newCust);
  }
}
