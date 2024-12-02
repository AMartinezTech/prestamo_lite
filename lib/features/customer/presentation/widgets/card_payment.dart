import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

class CardPayment extends StatelessWidget {
  final Customer customer;
  const CardPayment({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: Card(
          elevation: 5,
          color: const Color.fromARGB(255, 240, 240, 240),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  "Cuotas por cobrar: ${customer.qtyQuota - customer.paidQuota}",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  "Monto Cuota........: RD\$ ${NumberFormat("#,##0.00", "en_US").format(customer.amountQuota)}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Siguiente cuota \npor cobrar........: ${(customer.qtyQuota - customer.paidQuota == 0 ? 0 : customer.paidQuota + 1)}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
