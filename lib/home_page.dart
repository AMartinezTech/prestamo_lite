import 'package:flutter/material.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
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
                    builder: (context) =>
                        CustomerListPage(customers: customers()),
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

List<Customer> customers() {
  List<Customer> mockCustomers;

  mockCustomers = [
    Customer(
      id: 1,
      name: 'Juan Pérez',
      qtyQuota: 12,
      paidQuota: 2,
      amountQuota: 1500.0,
    ),
    Customer(
      id: 2,
      name: 'Ana Rodríguez',
      qtyQuota: 24,
      paidQuota: 0,
      amountQuota: 1200.0,
    ),
    Customer(
      id: 3,
      name: 'Carlos Gómez',
      qtyQuota: 6,
      paidQuota: 5,
      amountQuota: 2000.0,
    ),
    Customer(
      id: 4,
      name: 'María Fernández',
      qtyQuota: 15,
      paidQuota: 12,
      amountQuota: 1000.0,
    ),
    Customer(
      id: 5,
      name: 'Luis Morales',
      qtyQuota: 36,
      paidQuota: 20,
      amountQuota: 800.0,
    ),
    Customer(
      id: 6,
      name: 'Luis Castillo',
      qtyQuota: 36,
      paidQuota: 10,
      amountQuota: 800.0,
    ),
    Customer(
      id: 7,
      name: 'Luis De La Cruz',
      qtyQuota: 36,
      paidQuota: 15,
      amountQuota: 800.0,
    ),
  ];
  return mockCustomers;
}
