import 'package:get_it/get_it.dart';
import 'package:prestamo_lite/features/customer/data/datasource/customer_local_datasource.dart';
import 'package:prestamo_lite/features/customer/data/repositories/customer_repsitory_impl.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/get_all_customer_use_case.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/get_customer_by_id_use_case.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/save_customer_use_case.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';

final instanceDI = GetIt.instance;

Future<void> initDependencyInjections() async {
  // Bloc
  instanceDI.registerFactory(
    () => CustomerBloc(
      saveCustomerUseCase: instanceDI(),
      getAllCustomerUseCase: instanceDI(),
      getCustomerByIdUseCase: instanceDI(),
    ),
  );

  // Uses cases
  instanceDI.registerLazySingleton(
    () => GetAllCustomerUseCase(
      repository: instanceDI(),
    ),
  );
  instanceDI.registerLazySingleton(
    () => GetCustomerByIdUseCase(
      repository: instanceDI(),
    ),
  );
  instanceDI.registerLazySingleton(
    () => SaveCustomerUseCase(
      repository: instanceDI(),
    ),
  );

  // Repository
  instanceDI.registerLazySingleton<CustomerRepository>(
    () => CustomerRepsitoryImpl(customerLocalDataSource: instanceDI()),
  );

  // DataSoure
  instanceDI.registerLazySingleton<CustomerLocalDataSource>(
      () => HiveLocalDataSourceImpl());
}
