import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Gestión de pago"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("cliente y pagos que le restan con el pago actual a descontar")
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cerrar el diálogo sin guardar
          },
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Cerrar el diálogo tras guardar
          },
          child: const Text("Guardar"),
        ),
      ],
    );
  }
}
