import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routePath = '/';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('스플래시'),
      ),
    );
  }
}
