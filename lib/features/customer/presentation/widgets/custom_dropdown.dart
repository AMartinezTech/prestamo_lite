import 'package:flutter/material.dart';
import 'package:prestamo_lite/features/customer/domain/entities/customer.dart';

class CustomDropdown extends StatefulWidget {
  final List<Customer> customers;
  final ValueChanged<Customer?> onChangedValue;

  const CustomDropdown({
    super.key,
    required this.customers,
    required this.onChangedValue,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Customer? _selectedCustomer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(35.0),
      child: DropdownButtonFormField<Customer>(
        decoration: InputDecoration(
          labelText: "Selecciona un cliente",
          border: OutlineInputBorder(),
        ),
        value: _selectedCustomer,
        items: widget.customers.map((Customer customer) {
          return DropdownMenuItem<Customer>(
            value: customer,
            child: Text(customer.name),
          );
        }).toList(),
        onChanged: (Customer? newValue) {
          setState(() {
            _selectedCustomer = newValue;
          });
          widget.onChangedValue(newValue);
        },
        validator: (value) {
          if (value == null) {
            return "Por favor selecciona un cliente";
          }
          return null;
        },
      ),
    );
  }
}
