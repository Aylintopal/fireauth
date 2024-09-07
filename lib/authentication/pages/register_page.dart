import 'package:fireauth/authentication/pages/auth_screen.dart';
import 'package:fireauth/authentication/service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    Future<void> createUser() async {
      try {
        await FirebaseAuthService().createUser(
          email: _emailController.text,
          password: _passwordController.text,
        );
        print('Register success!');
      } on FirebaseAuthException catch (e) {
        setState(
          () => errorMessage = e.message,
        );
        print('$errorMessage');
      }
    }

    return AuthUiScreen(
      emailController: _emailController,
      passwordController: _passwordController,
      buttonOnPressed: () => createUser(),
      appBarTitle: 'Register',
      pageTitle: 'Create\nAccount',
    );
  }
}
