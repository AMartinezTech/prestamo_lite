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
  static const String boxName = "customers";
  HiveLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<List<CustomerModel>> getAllCustomer() async {
    try {
      Box<dynamic> box = await Hive.openBox(boxName);

      return box.values.map((c) => CustomerModel.fromJson(c)).toList();
    } catch (e) {
      throw LocalException(
        e.toString(),
      );
    }
  }

  @override
  Future<Customer> getCustomerById(int id) async {
    try {
      Box<dynamic> box = await Hive.openBox(boxName);

      return CustomerModel.fromJson(box.get(id));
    } catch (e) {
      throw LocalException(
        e.toString(),
      );
    }
  }

  @override
  Future<bool> saveCustomer(Customer customer) async {
    try {
      Box<dynamic> box = await Hive.openBox(boxName);
      box.put(
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
