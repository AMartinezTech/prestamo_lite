import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/core/utils/dependency_injection_container.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:prestamo_lite/home_page.dart';

void main() async {
  await initDependencyInjections();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => instanceDI<CustomerBloc>(),
        )
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
