import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/features/authentication/models/member.dart';
import 'package:hodoo_point/features/authentication/repos/auth_repository.dart';

class AuthNotifier extends AsyncNotifier<Members?> {
  late final AuthRepository _repository;

  @override
  FutureOr<Members?> build() async {
    _repository = ref.read(authRepo);
    return Future.value(null);
  }

  Future<void> signOut() async {
    if (state.value == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.signOut(state.value!.loginKind);
      return null;
    });
  }

  Future<void> signIn(LoginKind loginKind) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return switch (loginKind) {
        LoginKind.mobile => _repository.signInWithMobile(),
        LoginKind.naver => await _repository.signInWithNaver(),
        _ => null,
      };
    });
  }
}

final authProvider =
    AsyncNotifierProvider<AuthNotifier, Members?>(() => AuthNotifier());
final isLoggedIn =
    Provider<bool>((ref) => ref.watch(authProvider).value != null);
