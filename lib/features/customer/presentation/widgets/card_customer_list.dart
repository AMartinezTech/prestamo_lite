import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

class CardCustomerList extends StatelessWidget {
  final Customer customer;
  const CardCustomerList({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: SizedBox(
        width: 400,
        height: 170,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: const Color.fromARGB(255, 240, 240, 240),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      customer.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 70, 97, 43),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Monto Prest. RD\$ ${NumberFormat("#,##0.00", "en_US").format(customer.amountLoan)}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 158, 158, 158),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Cantidad cuotas.: ${customer.qtyQuota.toString()}"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Monto de cuotas: RD\$ ${NumberFormat("#,##0.00", "en_US").format(customer.amountLoan / customer.qtyQuota)}",
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "pagos realizados.: ${customer.paidQuota.toString()}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 70, 97, 43),
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "balance: RD\$ ${NumberFormat("#,##0.00", "en_US").format((customer.qtyQuota - customer.paidQuota) * (customer.amountLoan / customer.qtyQuota))}",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.redAccent),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "pagos pendientes: ${customer.qtyQuota - customer.paidQuota}",
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.w800),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
