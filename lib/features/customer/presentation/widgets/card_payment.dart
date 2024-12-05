import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prestamo_lite/core/utils/show_snackbar.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';

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
          elevation: 2,
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
                  "Monto Cuota........: RD\$ ${NumberFormat("#,##0.00", "en_US").format(customer.amountLoan / customer.qtyQuota)}",
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
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (customer.qtyQuota - customer.paidQuota == 0) {
                            showSnackBar(context,
                                "Éste cliente no tiene saldo pendiente");
                            return;
                          }

                          context.read<CustomerBloc>().add(OnSaveCustomer(
                                id: customer.id,
                                name: customer.name,
                                qtyQuota: customer.qtyQuota,
                                paidQuota: customer.paidQuota + 1,
                                amountLoan: customer.amountLoan,
                              ));
                          showSnackBar(context, "pago realizado con exito");
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [Icon(Icons.payment), Text("Cobrar cuota")],
                        ))
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
