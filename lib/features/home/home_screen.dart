import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routePath = '/home';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 100; i++)
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.purple[100 * (i % 10)],
          ),
      ],
    );
  }
}
