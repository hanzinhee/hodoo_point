import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/features/authentication/repos/authentication_repo.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const String routePath = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              ref.read(authRepo.notifier).signIn();
            },
            child: Text('로그인', style: TextStyle(fontSize: 20))),
      ),
    );
  }
}
