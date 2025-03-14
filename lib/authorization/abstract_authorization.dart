import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractAuthorization {
  Future<void> register(String email, String password);
  Future<void> singOut();
  Future<void> signIn(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> singGoogle();

  final user = FirebaseAuth.instance.currentUser;
}
