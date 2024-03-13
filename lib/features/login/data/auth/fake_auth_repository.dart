import 'package:chronicle/utils/in_memory_store.dart';

import '../../../../src.dart';

class FakeAuthRepository implements AuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  AppUser? get currentUser => null;

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _createNewUser(email);
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    _createNewUser(email);
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  void dispose() => _authState.close();

  void _createNewUser(String email) {
    if (currentUser == null) {
      _authState.value =
          AppUser(uid: email.split('').reversed.join(''), email: email);
    }
  }
}
