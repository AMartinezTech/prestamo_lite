part of 'customer_bloc.dart';

@immutable
sealed class CustomerEvent {}

final class CreateCustomer extends CustomerEvent {
  final int id;
  final String name;
  final int qtyQuota;
  final double amountQuota;

  CreateCustomer({
    required this.id,
    required this.name,
    required this.qtyQuota,
    required this.amountQuota,
  });
}
