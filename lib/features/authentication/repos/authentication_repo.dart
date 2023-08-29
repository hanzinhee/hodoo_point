import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  bool isLoggedIn = false;

  Future<void> signOut() async {
    isLoggedIn = false;
  }

  Future<void> signIn() async {
    isLoggedIn = true;
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());
