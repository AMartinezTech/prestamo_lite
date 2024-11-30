import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/get_all_customer_use_case.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/get_customer_by_id_use_case.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/save_customer_use_case.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final SaveCustomerUseCase _saveCustomerUseCase;
  final GetAllCustomerUseCase _getAllCustomerUseCase;
  final GetCustomerByIdUseCase _getcustomerByIdUseCase;

  CustomerBloc({
    required SaveCustomerUseCase saveCustomerUseCase,
    required GetAllCustomerUseCase getAllCustomerUseCase,
    required GetCustomerByIdUseCase getCustomerByIdUseCase,
  })  : _saveCustomerUseCase = saveCustomerUseCase,
        _getAllCustomerUseCase = getAllCustomerUseCase,
        _getcustomerByIdUseCase = getCustomerByIdUseCase,
        super(CustomerInitial()) {
    on<OnSaveCustomer>(_onSaveCustomerUseCase);
    on<OnGetAllCustomers>(_onGetAllCustomerUseCase);
    on<OnGetByIdCustomers>(_onGetByIdCustomerUseCase);
  }

  void _onSaveCustomerUseCase(
      OnSaveCustomer even, Emitter<CustomerState> emit) async {
    emit(CustomerLoaging());
    Customer customer = Customer(
      id: even.id,
      name: even.name,
      qtyQuota: even.qtyQuota,
      amountQuota: even.amountQuota,
    );
    final resp = await _saveCustomerUseCase(customer);

    resp.fold(
      (failure) => emit(CustomerFailure(failure.message)),
      (saved) {},
    );
  }

  void _onGetAllCustomerUseCase(
      OnGetAllCustomers even, Emitter<CustomerState> emit) async {
    emit(CustomerLoaging());

    final resp = await _getAllCustomerUseCase();

    resp.fold(
      (failure) => emit(CustomerFailure(failure.message)),
      (cs) => emit(CustomerList(customers: cs)),
    );
  }

  void _onGetByIdCustomerUseCase(
      OnGetByIdCustomers even, Emitter<CustomerState> emit) async {
    emit(CustomerLoaging());

    final resp = await _getcustomerByIdUseCase(even.id);

    resp.fold(
      (failure) => emit(CustomerFailure(failure.message)),
      (customer) => emit(CustomerSuccess(customer)),
    );
  }
}
