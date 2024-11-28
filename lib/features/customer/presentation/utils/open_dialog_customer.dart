import 'package:flutter/material.dart';
import 'package:prestamo_lite/features/customer/presentation/pages/customer_page.dart';

void openDialogCustomer(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const CustomerPage(),
  );
}
