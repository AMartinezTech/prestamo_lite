import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/core/common/widgets/loader.dart';
import 'package:prestamo_lite/core/utils/show_snackbar.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:prestamo_lite/features/customer/presentation/widgets/card_payment.dart';
import 'package:prestamo_lite/features/customer/presentation/widgets/custom_dropdown.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  Customer? _selectedCustomer;

  @override
  void initState() {
    super.initState();
    context.read<CustomerBloc>().add(OnGetAllCustomers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registro de pagos",
          style: TextStyle(color: Colors.white70),
        ),
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
                child: Text(
                  "No exiten clientes registrado",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              );
            } else {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown(
                            customers: state.customers,
                            onChangedValue: (Customer? customer) {
                              setState(() {
                                _selectedCustomer = customer;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    if (_selectedCustomer != null)
                      CardPayment(customer: _selectedCustomer!)
                  ],
                ),
              );
            }
          }
          return Center(
            child: Text("No se pudo cargar los datos"),
          );
        },
      ),
    );
  }
}
