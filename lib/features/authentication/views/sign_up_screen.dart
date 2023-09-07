import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hodoo_point/constants/gaps.dart';
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
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Image.asset('assets/images/icons/company/apple_logo_white.png'),
              Gaps.h1,
              const Text('Apple로 등록',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500))
            ]),
          ),
          Gaps.v1,
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xff03C75A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Image.asset('assets/images/icons/company/naver_logo_white.png'),
              Gaps.h1,
              const Text('NAVER로 등록',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500))
            ]),
          ),
          Gaps.v1,
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffFEE500),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Image.asset('assets/images/icons/company/kakao_logo_black.png'),
              Gaps.h1,
              const Text('Kakao로 등록',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500))
            ]),
          )
        ],
      ),
    );
  }
}
