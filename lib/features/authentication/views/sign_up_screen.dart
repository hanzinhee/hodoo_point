import 'package:flutter/material.dart';
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
          buildButton(
            onPressed: () {},
            label: const Text('휴대폰 인증',
                style: TextStyle(color: Colors.blueAccent)),
            icon: Image.asset(
              'assets/images/icons/flaticon/authentication.png',
              width: 18,
            ),
            borderSide: const BorderSide(color: Colors.blueAccent),
            overlayColor: Colors.blueAccent.withOpacity(0.1),
            backgroundColor: Colors.white,
          ),
          Gaps.v1,
          buildButton(
            onPressed: () {},
            label: const Text('Apple로 등록'),
            icon: Image.asset(
              'assets/images/icons/company/apple_logo_white.png',
              width: 18,
            ),
            backgroundColor: Colors.black,
          ),
          Gaps.v1,
          buildButton(
            onPressed: () {},
            label: const Text('NAVER로 등록'),
            icon: Image.asset(
              'assets/images/icons/company/naver_logo_white.png',
              width: 18,
            ),
            backgroundColor: const Color(0xff03C75A),
          ),
          Gaps.v1,
          buildButton(
            onPressed: () {},
            label: const Text(
              'Kakao로 등록',
              style: TextStyle(color: Colors.black),
            ),
            icon: Image.asset(
              'assets/images/icons/company/kakao_logo_black.png',
              width: 18,
            ),
            backgroundColor: const Color(0xffFEE500),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
      {VoidCallback? onPressed,
      required Widget label,
      Widget? icon,
      Color? backgroundColor,
      Color? overlayColor,
      BorderSide? borderSide}) {
    return SizedBox(
      height: 45,
      child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
            side: borderSide != null
                ? MaterialStateProperty.resolveWith((states) => borderSide)
                : null,
            backgroundColor: backgroundColor != null
                ? MaterialStateColor.resolveWith((states) => backgroundColor)
                : null,
            overlayColor: overlayColor != null
                ? MaterialStateColor.resolveWith((states) => overlayColor)
                : null,
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            if (icon != null) icon,
            Gaps.h1,
            DefaultTextStyle.merge(
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                child: label)
          ])),
    );
  }
}
