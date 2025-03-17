abstract class AbstractAuthorization {
  Future<void> register(String email, String password);
  Future<void> singOut();
  Future<void> signIn(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> singGoogle();
}
