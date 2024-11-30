import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required super.id,
    required super.name,
    required super.qtyQuota,
    required super.paidQuota,
    required super.amountQuota,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'],
      name: map['name'],
      qtyQuota: map['qtyQuota'],
      paidQuota: map['paidQuota'],
      amountQuota: map['amountQuota'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'qtyQuota': qtyQuota,
      'paidQuota': paidQuota,
      'amountQuota': amountQuota,
    };
  }

  factory CustomerModel.fromEntity(Customer customer) {
    return CustomerModel(
      id: customer.id,
      name: customer.name,
      qtyQuota: customer.qtyQuota,
      paidQuota: customer.paidQuota,
      amountQuota: customer.amountQuota,
    );
  }
}
