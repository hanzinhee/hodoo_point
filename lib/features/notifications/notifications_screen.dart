import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/services/unicons.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const String routePath = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알림'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Unicons.svg('fi-sr-cross'),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
      body: Center(child: Text('알림')),
    );
  }
}
