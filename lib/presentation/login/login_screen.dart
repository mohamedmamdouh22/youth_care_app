import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id='loginscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}