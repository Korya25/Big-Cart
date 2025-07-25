import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/lottie/Healthy or Junk food.json',
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
