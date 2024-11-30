part of 'customer_bloc.dart';

@immutable
sealed class CustomerEvent {}

final class OnSaveCustomer extends CustomerEvent {
  final int id;
  final String name;
  final int qtyQuota;
  final int paidQuota;
  final double amountQuota;

  OnSaveCustomer({
    required this.id,
    required this.name,
    required this.qtyQuota,
    required this.paidQuota,
    required this.amountQuota,
  });
}

final class OnGetAllCustomers extends CustomerEvent {
  OnGetAllCustomers();
}

final class OnGetByIdCustomers extends CustomerEvent {
  final int id;
  OnGetByIdCustomers({required this.id});
}
