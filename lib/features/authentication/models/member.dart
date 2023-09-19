import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

//  1 휴대폰로그인
//  2 생체인증로그인
//  3 앱카드로그인
//  4 네이버로그인
//  5 카카오로그인
//  6 애플로그인
enum LoginKind {
  mobile,
  biometric,
  appCard,
  naver,
  kakao,
  apple;

  static LoginKind from(int id) {
    switch (id) {
      case 1:
        return LoginKind.mobile;
      case 2:
        return LoginKind.biometric;
      case 3:
        return LoginKind.appCard;
      case 4:
        return LoginKind.naver;
      case 5:
        return LoginKind.kakao;
      case 6:
        return LoginKind.apple;
      default:
        return LoginKind.mobile;
    }
  }
}

class Members {
  // final String memberId;
  final String? name;
  final String? email;
  final String? mobile;
  final String? naverLoginKey;
  final String? kakaoLoginKey;
  final String? appleLoginKey;
  final LoginKind loginKind;
  final bool isSignedUp = false;

  Members(
      {
      // required this.memberId,
      this.name,
      this.email,
      this.mobile,
      this.naverLoginKey,
      this.kakaoLoginKey,
      this.appleLoginKey,
      required this.loginKind});

  factory Members.naver(NaverAccountResult account) {
    return Members(
      name: account.name,
      email: account.email,
      mobile: account.mobile,
      naverLoginKey: account.id,
      loginKind: LoginKind.naver,
    );
  }

  factory Members.kakao(User account) {
    return Members(
      name: account.kakaoAccount?.name ?? '',
      email: account.kakaoAccount?.email ?? '',
      mobile: account.kakaoAccount?.phoneNumber ?? '',
      kakaoLoginKey: account.id.toString(),
      loginKind: LoginKind.kakao,
    );
  }
}
