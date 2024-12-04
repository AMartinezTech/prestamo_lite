import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestamo_lite/core/common/widgets/loader.dart';
import 'package:prestamo_lite/core/theme/app_pallete.dart';
import 'package:prestamo_lite/core/utils/show_snackbar.dart';
import 'package:prestamo_lite/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:prestamo_lite/features/auth/presentation/pages/signup_page.dart';
import 'package:prestamo_lite/features/auth/presentation/widgets/auth_button.dart';
import 'package:prestamo_lite/features/auth/presentation/widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                  return const Loader();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "inicio de sessión",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 25),
                    AuthButton(
                      btnText: 'iniciar sessión',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          SignupPage.route(),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Si no tiene una cuenta. ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: 'Crea una aquí',
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
            ),
          ),
        ),
      ),
    );
  }
}
