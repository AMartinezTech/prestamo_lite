import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required super.id,
    required super.name,
    required super.qtyQuota,
    required super.amountQuota,
  });
}
