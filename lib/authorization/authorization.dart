import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop/authorization/abstract_authorization.dart';

class Authorization implements AbstractAuthorization {
  Authorization({required this.auth});

  @override
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth auth;

  @override
  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('error $e');
    }
  }

  @override
  Future<void> singOut() async {
    await auth.signOut();
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('error $e');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('error $e');
    }
  }

  @override
  Future<void> singGoogle() async {
    try {
      final googleProvider = GoogleAuthProvider();
      await auth.signInWithPopup(googleProvider);
    } catch (e) {
      print('error $e');
    }
  }
}
