import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/create_customer_use_case.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CreateCustomerUseCase _createCustomerUseCase;

  CustomerBloc({required final CreateCustomerUseCase createCustomerUseCase})
      : _createCustomerUseCase = createCustomerUseCase,
        super(CustomerInitial()) {
    on<CreateCustomer>(_onCreateCustomerUseCase);
  }

  void _onCreateCustomerUseCase(
      CreateCustomer even, Emitter<CustomerState> emit) {
    emit(CustomerLoaging());
    final res = _createCustomerUseCase(
      CreateCustomerUseCaseParams(
        id: even.id,
        name: even.name,
        qtyQuota: even.qtyQuota,
        amountQuota: even.amountQuota,
      ),
    );

    res.fold(
      (failure) => emit(CustomerFailure(failure.message)),
      (customer) => emit(CustomerSuccess(customer)),
    );
  }
}
