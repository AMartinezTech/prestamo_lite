import 'package:flutter/material.dart';
import 'package:prestamo_lite/home_page.dart';

void main() {
  runApp(const MainApp());
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
