import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final TextEditingController controller;
  const AuthField(
      {super.key,
      required this.hintText,
      this.isObscureText = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 395,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          // suffixIcon: isObscureText
          //     ? Icon(
          //         Icons.visibility,
          //         color: Colors.greenAccent,
          //       )
          //     : null,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText es oblicatorio!";
          }
          return null;
        },
        obscureText: isObscureText,
      ),
    );
  }
}
