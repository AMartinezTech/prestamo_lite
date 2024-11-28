import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/features/customer/data/datasource/local_datasource.dart';
import 'package:prestamo_lite/features/customer/data/repositories/customer_repsitory_impl.dart';
import 'package:prestamo_lite/features/customer/domain/use_case/create_customer_use_case.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:prestamo_lite/home_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CustomerBloc(
            createCustomerUseCase: CreateCustomerUseCase(
              CustomerRepsitoryImpl(LocalDataSource as LocalDataSource),
            ),
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Préstamo lite v1.0.0',
      home: HomePage(),
    );
  }
}
