import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void signOut() {
    state = false;
  }

  void signIn() {
    state = true;
  }
}

final authRepo = NotifierProvider<AuthenticationRepository, bool>(
    () => AuthenticationRepository());
