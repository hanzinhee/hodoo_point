import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/features/authentication/models/member.dart';

class MemberState extends AsyncNotifier<Members?> {
  @override
  FutureOr<Members?> build() async {
    return Future.value(await FlutterNaverLogin.isLoggedIn
        ? null
        : Members.naver(await FlutterNaverLogin.currentAccount()));
  }

  void signOut() {
    if (state.value?.loginKind == LoginKind.naver) {
      FlutterNaverLogin.logOut();
    }
    state = AsyncValue.data(null);
  }

  void signIn() {
    state = AsyncValue.data(Members(
        name: '홍길동',
        email: 'hong@email.kr',
        loginKind: LoginKind.mobile,
        mobile: '01012345678'));
  }

  Future<void> signInWithNaver(
      {void Function(bool loggedIn)? onComplete}) async {
    state = const AsyncValue.loading();
    AsyncValue.guard(() async {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();

      return result.status == NaverLoginStatus.loggedIn
          ? Members.naver(result.account)
          : null;
    }).whenComplete(() {});
  }
}
