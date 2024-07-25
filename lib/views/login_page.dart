import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_demoapp/bloc/auth_bloc.dart';

import '../custom_widgets/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                  ),
                ),
                Button(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthLoginRequested(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()));
                  },
                  label: 'Login',
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
