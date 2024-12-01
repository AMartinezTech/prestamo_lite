import 'package:hive_flutter/hive_flutter.dart';
import 'package:prestamo_lite/core/error/exceptions.dart';
import 'package:prestamo_lite/features/customer/data/models/customer_model.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

abstract interface class CustomerLocalDataSource {
  Future<Customer> getCustomerById(int id);
  Future<List<CustomerModel>> getAllCustomer();
  Future<bool> saveCustomer(Customer customer);
}

class HiveLocalDataSourceImpl implements CustomerLocalDataSource {
  final Box<Map> _customerBox;

  HiveLocalDataSourceImpl(this._customerBox);

  static Future<HiveLocalDataSourceImpl> create() async {
    final box = await Hive.openBox<Map>("customers");
    return HiveLocalDataSourceImpl(box);
  }

  @override
  Future<List<CustomerModel>> getAllCustomer() async {
    try {
      // Box<dynamic> box = await Hive.openBox("customers");

      // return  box.values.map((c) => CustomerModel.fromJson(c)).toList();

      return _customerBox.values
          .map((c) => CustomerModel.fromJson(Map<String, dynamic>.from(c)))
          .toList();
    } catch (e) {
      throw LocalException(
        e.toString(),
      );
    }
  }

  @override
  Future<Customer> getCustomerById(int id) async {
    try {
      final customerData = _customerBox.get(id);
      if (customerData == null) {
        throw LocalException("Cliente con ID $id no encontrado");
      }
      return CustomerModel.fromJson(Map<String, dynamic>.from(customerData));
    } catch (e) {
      throw LocalException(
        e.toString(),
      );
    }
  }

  @override
  Future<bool> saveCustomer(Customer customer) async {
    try {
      await _customerBox.put(
        customer.id,
        CustomerModel.fromEntity(customer).toJson(),
      );
      return true;
    } catch (e) {
      throw LocalException(
        e.toString(),
      );
    }
  }
}
