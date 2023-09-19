import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/authentication/views/widgets/login_button.dart';
import 'package:hodoo_point/widgets/hodoo_app_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routePath = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HodooAppBar(),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(Gaps.size2),
        shrinkWrap: true,
        children: [
          const Text('회원가입',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Gaps.v2,
          const Text('호두 포인트의 해택을 누리세요.'),
          Gaps.v6,
          LoginButton.kakao(onPressed: () {}, label: '카카오로 가입하기'),
          Gaps.v1,
          LoginButton.naver(onPressed: () {}, label: '네이버로 가입하기'),
          Gaps.v1,
          LoginButton.mobile(onPressed: () {}, label: '휴대폰 번호로 가입하기'),
          Gaps.v1,
        ],
      ),
    );
  }
}
