// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:prestamo_lite/core/utils/dependency_injection_container.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:prestamo_lite/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // if (Platform.isAndroid || Platform.isIOS) {
  //   // Para móviles
  //   await Hive.initFlutter();
  // } else {
  //   // Para escritorio (Windows/macOS)
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   Hive.init(appDocDir.path);
  // }
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Préstamo lite v1.0.0',
      home: HomePage(),
    );
  }
}
