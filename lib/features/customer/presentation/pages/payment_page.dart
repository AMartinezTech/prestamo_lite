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
        title: Text("Registro de pagos"),
        backgroundColor: const Color.fromARGB(255, 203, 231, 175),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedCustomer!.qtyQuota - _selectedCustomer!.paidQuota == 0) {
            showSnackBar(context, "Éste cliente no tiene saldo pendiente");
            return;
          }
          if (_selectedCustomer != null) {
            context.read<CustomerBloc>().add(OnSaveCustomer(
                  id: _selectedCustomer!.id,
                  name: _selectedCustomer!.name,
                  qtyQuota: _selectedCustomer!.qtyQuota,
                  paidQuota: _selectedCustomer!.paidQuota + 1,
                  amountQuota: _selectedCustomer!.amountQuota,
                ));
            showSnackBar(context, "pago realizado con exito");
            Navigator.pop(context);
          } else {
            showSnackBar(context, "Seleccione un cliente.");
          }
        },
        tooltip: "Aplicar pago",
        child: Icon(Icons.payment),
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
