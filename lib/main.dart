import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prestamo_lite/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:prestamo_lite/core/theme/app_theme.dart';
import 'package:prestamo_lite/core/utils/dependency_injection_container.dart';
import 'package:prestamo_lite/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:prestamo_lite/features/auth/presentation/pages/login_page.dart';
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
          create: (_) => instanceDI<AppUserCubit>(),
        ),
        BlocProvider(
          create: (_) => instanceDI<AuthBloc>(),
        ),
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
    return MaterialApp(
      title: 'Préstamo lite v1.0.0',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
