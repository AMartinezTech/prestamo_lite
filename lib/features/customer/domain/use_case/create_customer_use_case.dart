import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';

class CreateCustomerUseCase {
  final CustomerRepository customerRepository;
  const CreateCustomerUseCase(this.customerRepository);

  void call(CreateCustomerUseCaseParams params) {
    customerRepository.createCustomer(
      id: params.id,
      name: params.name,
      qtyQuota: params.qtyQuota,
      amountQuota: params.amountQuota,
    );
  }
}

class CreateCustomerUseCaseParams {
  final int id;
  final String name;
  final int qtyQuota;
  final double amountQuota;

  CreateCustomerUseCaseParams({
    required this.id,
    required this.name,
    required this.qtyQuota,
    required this.amountQuota,
  });
}
