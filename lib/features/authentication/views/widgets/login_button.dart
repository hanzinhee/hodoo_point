import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hodoo_point/constants/gaps.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      this.onPressed,
      required this.label,
      this.icon,
      this.backgroundColor,
      this.overlayColor,
      this.borderSide});

  factory LoginButton.naver(
      {VoidCallback? onPressed, String label = '네이버로 시작하기'}) {
    return LoginButton(
        onPressed: onPressed,
        backgroundColor: const Color(0xff03C75A),
        label: Text(label),
        icon: SvgPicture.asset('assets/images/icons/logins/naver.svg'));
  }
  factory LoginButton.kakao(
      {VoidCallback? onPressed, String label = '카카오로 시작하기'}) {
    return LoginButton(
        onPressed: onPressed,
        backgroundColor: const Color(0xffFEE500),
        label: Text(label, style: const TextStyle(color: Colors.black)),
        icon: SvgPicture.asset('assets/images/icons/logins/kakao.svg'));
  }

  factory LoginButton.mobile(
      {VoidCallback? onPressed, String label = '휴대폰 번호로 시작하기'}) {
    return LoginButton(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        label: Text(label, style: const TextStyle(color: Colors.blueAccent)),
        icon: SvgPicture.asset('assets/images/icons/logins/mobile-app.svg'),
        borderSide: const BorderSide(color: Colors.blueAccent),
        overlayColor: Colors.blueAccent.withOpacity(0.1));
  }

  final VoidCallback? onPressed;
  final Widget label;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: Gaps.size2)),
            side: borderSide != null
                ? MaterialStateProperty.resolveWith((states) => borderSide)
                : null,
            backgroundColor: backgroundColor != null
                ? MaterialStateColor.resolveWith((states) => backgroundColor!)
                : null,
            overlayColor: overlayColor != null
                ? MaterialStateColor.resolveWith((states) => overlayColor!)
                : null,
          ),
          child: Stack(children: [
            if (icon != null)
              Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(width: 30, child: icon!)),
            Gaps.h1,
            Center(
              child: DefaultTextStyle.merge(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  child: label),
            )
          ])),
    );
  }
}
