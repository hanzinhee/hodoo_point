import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/features/authentication/models/member.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class AuthRepository {
  final Dio _dio = Dio();

  AuthRepository() {
    _dio.options.baseUrl = 'http://10.0.2.2:3000/api';
  }
  Members? signInWithMobile() {
    return Members(
        name: '홍길동',
        email: 'hond@email.com',
        loginKind: LoginKind.mobile,
        mobile: '01012345678');
  }

  Future<Members?> signInWithNaver() async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    return result.status == NaverLoginStatus.loggedIn
        ? await Members.naver(result.account)
        : null;
  }

  Future<Members?> signInWithKakao() async {
    // debugPrint(await KakaoSdk.origin); // 키 해시 값 확인
    if (await isKakaoTalkInstalled()) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }
    final User user = await UserApi.instance.me();
    return Members.kakao(user);
  }

  Future<void> signOut(LoginKind loginKind) async {
    if ((loginKind == LoginKind.naver) && await FlutterNaverLogin.isLoggedIn) {
      await FlutterNaverLogin.logOut();
    }
  }

  Future<dynamic> getMemberInfo(String id) async {
    await _dio.post('/member/info', data: {'id': id});
    return null;
  }
}

final authRepo = Provider((ref) => AuthRepository());
