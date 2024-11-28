part of 'customer_bloc.dart';

@immutable
sealed class CustomerEvent {}

final class OnSaveCustomer extends CustomerEvent {
  final Customer customer;
  OnSaveCustomer({required this.customer});
}

final class OnGetAllCustomers extends CustomerEvent {
  OnGetAllCustomers();
}

final class OnGetByIdCustomers extends CustomerEvent {
  final int id;
  OnGetByIdCustomers({required this.id});
}
