import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/features/authentication/models/member.dart';

class AuthRepository {
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
        ? Members.naver(result.account)
        : null;
  }

  Future<void> signOut(LoginKind loginKind) async {
    if ((loginKind == LoginKind.naver) && await FlutterNaverLogin.isLoggedIn) {
      await FlutterNaverLogin.logOut();
    }
  }
}

final authRepo = Provider((ref) => AuthRepository());
