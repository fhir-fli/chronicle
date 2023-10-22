import '../../../src.dart';

class FakeAuthRepository implements AuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  AppUser? get currentUser => _authState.value;

  @override
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (currentUser == null) {
      _createNewUser(email);
    }
    return;
  }

  @override
  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (currentUser == null) {
      _createNewUser(email);
    }
    return;
  }

  void _createNewUser(String email) {
    _authState.value =
        AppUser(uid: email.split('').reversed.join(''), email: email);
  }

  void dispose() => _authState.close();

  @override
  Future<bool> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    _authState.value = null;
    return true;
  }
}
