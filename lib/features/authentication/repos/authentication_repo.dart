import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository extends Notifier<bool> {
  void signOut() {
    state = false;
  }

  void signIn() {
    state = true;
  }

  @override
  bool build() {
    return false;
  }
}

final authRepo = NotifierProvider<AuthenticationRepository, bool>(
    () => AuthenticationRepository());
