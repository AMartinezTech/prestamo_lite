part of 'customer_bloc.dart';

@immutable
sealed class CustomerState {
  const CustomerState();
}

final class CustomerInitial extends CustomerState {}

final class CustomerLoaging extends CustomerState {}

final class CustomerSuccess extends CustomerState {
  final Customer customer;
  const CustomerSuccess(this.customer);
}

final class CustomerFailure extends CustomerState {
  final String message;
  const CustomerFailure(this.message);
}
