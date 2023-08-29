import 'package:flutter/material.dart';

class LoungeScreen extends StatelessWidget {
  const LoungeScreen({super.key});
  static String routePath = '/lounge';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(onPressed: () {}, child: Text('라운지')),
            TextField()
          ],
        ),
      ),
    );
  }
}
