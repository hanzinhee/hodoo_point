import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/authentication/models/member.dart';
import 'package:hodoo_point/features/authentication/states/auth_notifier.dart';
import 'package:hodoo_point/features/authentication/views/widgets/login_button.dart';
import 'package:hodoo_point/common/widgets/hodoo_app_bar.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const String routePath = '/login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool checkedKeepLogin = false;

  Future<void> signIn(LoginKind loginKind) async {
    ref.read(authProvider.notifier).signIn(loginKind).then((_) {
      if (ref.read(isLoggedIn)) context.pop();
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HodooAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Gaps.size2),
        child: ListView(
          controller: ScrollController(),
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
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    setState(() {
                      checkedKeepLogin = !checkedKeepLogin;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: checkedKeepLogin,
                        checkColor: Colors.blueAccent,
                        activeColor: Colors.transparent,
                        side: BorderSide(color: Colors.grey[400]!),
                        onChanged: (value) {
                          setState(() {
                            checkedKeepLogin = value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey[400]!)),
                      ),
                      const Text('로그인 유지')
                    ],
                  ),
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
            SizedBox(
              height: 50,
              child: FilledButton(
                  onPressed: () {
                    signIn(LoginKind.mobile);
                  },
                  child: const Text('로그인', style: TextStyle(fontSize: 20))),
            ),
            Gaps.v3,
            const Row(
              children: [
                Expanded(
                    child: Divider(
                  endIndent: 10,
                )),
                Text('간편 로그인', style: TextStyle(color: Colors.grey)),
                Expanded(child: Divider(indent: 10)),
              ],
            ),
            Gaps.v3,
            LoginButton.naver(onPressed: () {
              signIn(LoginKind.naver);
            }),
            Gaps.v1,
            LoginButton.kakao(onPressed: () {
              signIn(LoginKind.kakao);
            }),
            Gaps.v1,
            LoginButton.mobile(onPressed: () {
              signIn(LoginKind.mobile);
            }),
            Gaps.v4,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('아직 회원이 아니신가요?',
                    style: TextStyle(color: Colors.grey)),
                TextButton(
                    onPressed: () {
                      context.push('/sign-up');
                    },
                    child: const Text(
                      '회원가입',
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
