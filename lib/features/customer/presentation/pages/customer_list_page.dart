import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

class CustomerListPage extends StatefulWidget {
  final List<Customer> customers;
  const CustomerListPage({
    super.key,
    required this.customers,
  });

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de clientes"),
        ),
        backgroundColor: const Color.fromARGB(255, 203, 231, 175),
      ),
      body: ListView.builder(
        itemCount: widget.customers.length,
        itemBuilder: (context, index) {
          return cardItem(widget.customers[index]);
        },
      ),
    );
  }
}

// Widget para mostrar un cliente individual
Widget cardItem(Customer customer) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: SizedBox(
      width: 400,
      height: 100,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color.fromARGB(255, 203, 231, 175),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "código: ${customer.id.toString()}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 158, 158, 158),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    customer.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("Cuotas ${customer.qtyQuota.toString()}"),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "RD\$ ${NumberFormat("#,##0.00", "en_US").format(customer.qtyQuota * customer.amountQuota)}",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
