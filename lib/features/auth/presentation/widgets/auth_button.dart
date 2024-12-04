import 'package:flutter/material.dart';
import 'package:prestamo_lite/core/theme/app_pallete.dart';

class AuthButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: AppPalette.buttonPrimary),
      child: Text(
        btnText,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white70,
            letterSpacing: 2),
      ),
    );
  }
}


//const Color.fromARGB(255, 40, 65, 53)