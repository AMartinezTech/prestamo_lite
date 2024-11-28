import 'package:prestamo_lite/core/error/exceptions.dart';
import 'package:prestamo_lite/features/customer/data/models/customer_model.dart';

abstract interface class LocalDataSource {
  CustomerModel createCustomer({
    required int id,
    required String name,
    required int qtyQuota,
    required double amountQuota,
  });
}

class LocalDatasourceImpl implements LocalDataSource {
  @override
  CustomerModel createCustomer(
      {required int id,
      required String name,
      required int qtyQuota,
      required double amountQuota}) {
    try {
      if (id == 0) {
        throw LocalException('Id no válido!');
      }

      CustomerModel newCust = CustomerModel(
          id: id, name: name, qtyQuota: qtyQuota, amountQuota: amountQuota);

      return newCust;
    } catch (e) {
      throw LocalException('No se pudo crear el cliente!');
    }
  }
}
