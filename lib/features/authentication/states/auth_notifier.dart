import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/features/authentication/models/member.dart';
import 'package:hodoo_point/features/authentication/repos/auth_repository.dart';

class AuthNotifier extends Notifier<Members?> {
  late final AuthRepository _repository;

  @override
  Members? build() {
    _repository = ref.read(authRepo);
    return null;
  }

  Future<void> signOut() async {
    if (state == null) return;
    await _repository.signOut(state!.loginKind);
    state = null;
  }

  Future<void> signIn(LoginKind loginKind) async {
    state = switch (loginKind) {
      LoginKind.mobile => _repository.signInWithMobile(),
      LoginKind.naver => await _repository.signInWithNaver(),
      LoginKind.kakao => await _repository.signInWithKakao(),
      _ => null,
    };
  }
}

final authProvider =
    NotifierProvider<AuthNotifier, Members?>(() => AuthNotifier());
final isLoggedIn = Provider<bool>((ref) => ref.watch(authProvider) != null);
