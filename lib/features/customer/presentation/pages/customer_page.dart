import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/core/common/widgets/loader.dart';
import 'package:prestamo_lite/core/utils/show_snackbar.dart';
import 'package:prestamo_lite/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:prestamo_lite/features/customer/presentation/widgets/custom_field.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final nameController = TextEditingController();
  final qtyQuotaController = TextEditingController();
  final amountQuotaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Gestión de cliente"),
      content: SingleChildScrollView(
        child: BlocConsumer<CustomerBloc, CustomerState>(
          listener: (context, state) {
            if (state is CustomerFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is CustomerLoaging) {
              return const Loader();
            }
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomField(
                    hintText: "Nombre",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, ingrese el nombre";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomField(
                    hintText: "No. de cuotas",
                    controller: qtyQuotaController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, ingrese el número de cuotas";
                      }
                      if (int.tryParse(value) == null) {
                        return "Debe ser un número válido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomField(
                    hintText: "Monto de cuotas",
                    controller: amountQuotaController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, ingrese el monto de cuotas";
                      }
                      if (double.tryParse(value) == null) {
                        return "Debe ser un número válido";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            );
          },
        ),
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
            if (_formKey.currentState!.validate()) {
              context.read<CustomerBloc>().add(OnSaveCustomer(
                    id: 0,
                    name: nameController.text.trim(),
                    qtyQuota: int.parse(qtyQuotaController.text.trim()),
                    paidQuota: 0,
                    amountQuota:
                        double.parse(amountQuotaController.text.trim()),
                  ));
              Navigator.of(context)
                  .pop(); // Cerrar el diálogo despúes de guardar
            }
          },
          child: const Text("Guardar"),
        ),
      ],
    );
  }
}
