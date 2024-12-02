import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/core/common/widgets/loader.dart';
import 'package:prestamo_lite/core/utils/show_snackbar.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:prestamo_lite/features/customer/presentation/widgets/card_customer_list.dart';

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
        title: Text("Lista de cuentas por cobrar"),
        backgroundColor: const Color.fromARGB(255, 203, 231, 175),
      ),
      body: BlocConsumer<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state is CustomerFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CustomerLoaging) {
            return const Loader();
          } else if (state is CustomerLoaded) {
            if (state.customers.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mood),
                    Text(
                      "No existen cuentas por cobrar pendientes",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 15, 160, 34),
                      ),
                    )
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.customers.length,
              itemBuilder: (context, index) {
                return CardCustomerList(customer: state.customers[index]);
              },
            );
          }
          return Center(
            child: Column(
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                Text(
                  "Algo falló al cargar el listado",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
