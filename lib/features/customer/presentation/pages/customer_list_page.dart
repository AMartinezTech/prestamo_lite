import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prestamo_lite/core/common/widgets/loader.dart';
import 'package:prestamo_lite/core/utils/show_snackbar.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';

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
  void initState() {
    super.initState();
    // Solicita la lista de clientes al Bloc al iniciar la página
    context.read<CustomerBloc>().add(OnGetAllCustomers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de clientes"),
        backgroundColor: const Color.fromARGB(255, 203, 231, 175),
      ),
      body: BlocConsumer<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state is CustomerFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CustomerInitial) {
            return const Loader();
          } else if (state is CustomerLoaded) {
            if (state.customers.isEmpty) {
              return Center(
                child: Text(
                  "Listado vacío",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.customers.length,
              itemBuilder: (context, index) {
                return cardItem(state.customers[index]);
              },
            );
          }
          return Center(
            child: Text("Listado vacío"),
          );
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
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Monto cuota RD\$ ${NumberFormat("#,##0.00", "en_US").format(customer.amountQuota)}",
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
              Row(
                children: [
                  Text("Ctas. ${customer.qtyQuota.toString()}"),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Monto RD\$ ${NumberFormat("#,##0.00", "en_US").format(customer.qtyQuota * customer.amountQuota)}",
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Pagos ${customer.paidQuota.toString()}"),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Bce. RD\$ ${NumberFormat("#,##0.00", "en_US").format((customer.qtyQuota - customer.paidQuota) * customer.amountQuota)}",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
