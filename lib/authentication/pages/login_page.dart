import 'package:fireauth/authentication/pages/auth_screen.dart';
import 'package:fireauth/authentication/service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? errorMessage;

  Future<void> signIn() async {
    try {
      await FirebaseAuthService().signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('Login success!');
    } on FirebaseAuthException catch (e) {
      setState(
        () => errorMessage = e.message,
      );
      print('$errorMessage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthUiScreen(
      emailController: _emailController,
      passwordController: _passwordController,
      buttonOnPressed: () => signIn(),
      appBarTitle: 'Login',
      pageTitle: 'Welcome\nBack',
      showForgotButton: true,
    );
  }
}
