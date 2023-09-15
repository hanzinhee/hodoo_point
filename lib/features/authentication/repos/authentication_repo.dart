import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/features/authentication/models/member.dart';

class AuthenticationRepository {
  Members? _members;
  Members? get members => _members;

  void signIn() {
    _members = Members(
        name: '홍길동',
        email: 'hond@email.com',
        loginKind: LoginKind.mobile,
        mobile: '01012345678');
  }

  Future<void> signInWithNaver(
      {void Function(bool loggedIn)? onComplete}) async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();

    _members = result.status == NaverLoginStatus.loggedIn
        ? Members.naver(result.account)
        : null;
  }

  Future<void> signOut() async {
    if ((_members?.loginKind == LoginKind.naver) &&
        await FlutterNaverLogin.isLoggedIn) await FlutterNaverLogin.logOut();
    _members = null;
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());
