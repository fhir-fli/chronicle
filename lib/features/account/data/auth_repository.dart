import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;
  Future<void> signIn();
  Future<bool> signOut();
  Future<bool> logout();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = FakeAuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
