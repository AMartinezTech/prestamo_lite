import 'package:flutter/material.dart';
import 'package:prestamo_lite/features/customer/presentation/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
