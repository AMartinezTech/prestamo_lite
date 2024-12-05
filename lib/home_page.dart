import 'package:flutter/material.dart';

import 'package:prestamo_lite/features/customer/presentation/pages/customer_list_page.dart';
import 'package:prestamo_lite/features/customer/presentation/utils/open_dialog_payment.dart';
import 'package:prestamo_lite/features/customer/presentation/widgets/menu_button.dart';

import 'features/customer/presentation/utils/open_dialog_customer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Inversiones AMartínez, S.R.L.",
              style: TextStyle(color: Colors.white70)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
                title: "Gestión de Clientes",
                subtitle: "Administra el registro de los clientes",
                onButtonPressed: () {
                  openDialogCustomer(context);
                }),
            const SizedBox(
              height: 30,
            ),
            MenuButton(
              title: "Gestión de Pagos",
              subtitle: "Registra pagos hechos por los clientes",
              onButtonPressed: () {
                openDialogPayment(context);
              },
              icon: Icons.payments,
              buttonText: "registrar",
            ),
            const SizedBox(
              height: 30,
            ),
            MenuButton(
              title: "Lista de cuentas por cobrar",
              subtitle: "Lista de clientes con sus saldos",
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerListPage(),
                  ),
                );
              },
              icon: Icons.insert_chart_outlined_rounded,
              buttonText: "ver listado",
            ),
          ],
        ),
      ),
    );
  }
}
