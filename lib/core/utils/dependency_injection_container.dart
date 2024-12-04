import 'package:get_it/get_it.dart';
import 'package:prestamo_lite/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:prestamo_lite/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:prestamo_lite/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:prestamo_lite/features/auth/domain/repositories/auth_repository.dart';
import 'package:prestamo_lite/features/auth/domain/usecases/current_user_use_case.dart';
import 'package:prestamo_lite/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:prestamo_lite/features/auth/domain/usecases/sign_with_email_password_use_case.dart';
import 'package:prestamo_lite/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:prestamo_lite/features/customer/data/datasource/customer_local_datasource.dart';
import 'package:prestamo_lite/features/customer/data/repositories/customer_repsitory_impl.dart';
import 'package:prestamo_lite/features/customer/domain/repositories/customer_repository.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/get_all_customer_use_case.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/get_customer_by_id_use_case.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/save_customer_use_case.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';

final instanceDI = GetIt.instance;

Future<void> initDependencyInjections() async {
  // Inicializar HiveLocalDataSourceImpl de manera asíncrona

  //AuthLocalDataSourceImpl
  final hiveLocalDataSource = await HiveLocalDataSourceImpl.create();
  final hiveAuthLocalDataSource = await AuthLocalDataSourceImpl.create();

  // Core
  instanceDI.registerLazySingleton(() => AppUserCubit());

  // Bloc
  instanceDI.registerFactory(
    () => CustomerBloc(
      saveCustomerUseCase: instanceDI(),
      getAllCustomerUseCase: instanceDI(),
      getCustomerByIdUseCase: instanceDI(),
    ),
  );
  instanceDI.registerFactory(
    () => AuthBloc(
      signWithEmailPasswordUseCase: instanceDI(),
      loginUserUseCase: instanceDI(),
      appUserCubit: instanceDI(),
      currentUserUseCase: instanceDI(),
    ),
  );
  // Uses cases
  instanceDI
      .registerFactory(() => GetAllCustomerUseCase(repository: instanceDI()));
  instanceDI
      .registerFactory(() => GetCustomerByIdUseCase(repository: instanceDI()));
  instanceDI
      .registerFactory(() => SaveCustomerUseCase(repository: instanceDI()));
  instanceDI.registerFactory(
      () => SignWithEmailPasswordUseCase(repository: instanceDI()));
  instanceDI.registerFactory(() => LoginUserUseCase(repository: instanceDI()));
  instanceDI.registerFactory(() => CurrentUserUseCase(instanceDI()));

  // Repository
  instanceDI.registerLazySingleton<CustomerRepository>(
    () => CustomerRepsitoryImpl(customerLocalDataSource: instanceDI()),
  );

  instanceDI.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authLocalDataSource: instanceDI()),
  );

  // Registrar DataSource
  instanceDI.registerLazySingleton<CustomerLocalDataSource>(
    () => hiveLocalDataSource,
  );

  instanceDI.registerLazySingleton<AuthLocalDataSource>(
    () => hiveAuthLocalDataSource,
  );
}
