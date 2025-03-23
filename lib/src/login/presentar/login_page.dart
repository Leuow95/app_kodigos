import 'package:app_kodigos/src/login/presentar/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLogged) {
              Navigator.pushReplacementNamed(context, '/home');
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_kodigos.png', width: 200, height: 200),
                SizedBox(height: 32),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha', prefixIcon: Icon(Icons.lock)),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    context.read<AuthCubit>().login(email, password);
                  },
                  child: Text('Entrar'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
