import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/authentication/repos/authentication_repo.dart';
import 'package:hodoo_point/widgets/hodoo_app_bar.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const String routePath = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: HodooAppBar(
        actions: [
          TextButton(
            style: TextButton.styleFrom(),
            child: const Text('회원가입', style: TextStyle(fontSize: 12)),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Gaps.size2),
        child: Column(
          children: [
            const Text(
              'HODOO POINT',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Gaps.v2,
            TextFormField(
              decoration: const InputDecoration(
                hintText: '아이디',
                border: OutlineInputBorder(),
              ),
            ),
            Gaps.v1,
            TextFormField(
              decoration: const InputDecoration(
                hintText: '비밀번호',
                border: OutlineInputBorder(),
              ),
            ),
            Gaps.v1,
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      checkColor: Colors.blueAccent,
                      activeColor: Colors.transparent,
                      side: BorderSide(color: Colors.grey[400]!),
                      onChanged: (value) {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.grey[400]!)),
                    ),
                    const Text('로그인 유지')
                  ],
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      '로그인 정보를 잊으셨나요?',
                      style: TextStyle(color: Colors.grey),
                    ))
              ],
            ),
            Gaps.v1,
            ElevatedButton(
                onPressed: () {
                  ref.read(authRepo.notifier).signIn();
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text('로그인', style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
