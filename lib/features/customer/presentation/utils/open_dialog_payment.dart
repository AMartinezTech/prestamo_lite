import 'package:flutter/material.dart';
import 'package:prestamo_lite/features/customer/presentation/pages/payment_page.dart';

void openDialogPayment(BuildContext context) {
  showDialog(
    context: context,
    builder: (builder) => const PaymentPage(),
  );
}
