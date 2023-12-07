import '../../../src.dart';

class AtSignRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges();
  @override
  AppUser? get currentUser;
  @override
  Future<void> signInWithEmailAndPassword(String email, String password);
  @override
  Future<void> createUserWithEmailAndPassword(String email, String password);
  @override
  Future<bool> signOut();
  @override
  Future<bool> logout();
}
