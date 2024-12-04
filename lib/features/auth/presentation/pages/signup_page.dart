import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/core/common/widgets/loader.dart';
import 'package:prestamo_lite/core/theme/app_pallete.dart';
import 'package:prestamo_lite/core/utils/show_snackbar.dart';
import 'package:prestamo_lite/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:prestamo_lite/features/auth/presentation/pages/login_page.dart';
import 'package:prestamo_lite/features/auth/presentation/widgets/auth_button.dart';
import 'package:prestamo_lite/features/auth/presentation/widgets/auth_field.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inversiones AMartínez, S.R.L.",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: formKey,
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    showSnackBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Loader();
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "registro de usuarios",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                      const SizedBox(height: 20),
                      AuthField(
                        controller: nameController,
                        hintText: 'Nombre completo',
                      ),
                      const SizedBox(height: 15),
                      AuthField(
                        controller: emailController,
                        hintText: 'Correo',
                      ),
                      const SizedBox(height: 15),
                      AuthField(
                        controller: passwordController,
                        hintText: 'Clave',
                        isObscureText: true,
                      ),
                      const SizedBox(height: 30),
                      AuthButton(
                        btnText: "registrar",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignUp(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                          if (state is AuthSuccess) {
                            showSnackBar(context, "Usuario creado con exito");
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            LoginPage.route(),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                              text: "Si tiene una cuenta. ",
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                                TextSpan(
                                  text: 'Inicia sessión',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: AppPalette.buttonPrimary,
                                          fontWeight: FontWeight.w700),
                                )
                              ]),
                        ),
                      )
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
