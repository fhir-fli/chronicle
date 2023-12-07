import '../../../src.dart';

class FakeAuthRepository implements AuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  AppUser? get currentUser => _authState.value;

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (currentUser == null) {
      _createNewUser(email, password);
    }
    return;
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (currentUser == null) {
      _createNewUser(email, password);
    }
    return;
  }

  void _createNewUser(String email, String password) {
    _authState.value = AppUser(
      uid: email.split('').reversed.join(''),
      email: email,
      password: password,
    );
  }

  void dispose() => _authState.close();

  @override
  Future<bool> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    _authState.value = null;
    return true;
  }

  @override
  Future<bool> logout() => signOut();

  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
