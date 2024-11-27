import 'package:flutter/material.dart';
import 'package:prestamo_lite/features/customer/presentation/widgets/menu_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Inversiones AMartínez, S.R.L."),
          ),
          backgroundColor: const Color.fromARGB(255, 203, 231, 175),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(
                title: "Gestión de Clientes",
                subtitle: "Administra el registro de tus clientes",
                onButtonPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              MenuButton(
                title: "Gestión de Pagos",
                subtitle: "Registra pagos hechos por los clientes",
                onButtonPressed: () {},
                icon: Icons.payments,
              ),
              const SizedBox(
                height: 30,
              ),
              MenuButton(
                title: "Lista de clientes",
                subtitle: "Lista de clientes con sus saldos",
                onButtonPressed: () {},
                icon: Icons.list,
                buttonText: "ver listado",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
