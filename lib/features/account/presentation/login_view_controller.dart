import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class LoginViewController extends StateNotifier<AsyncValue> {
  LoginViewController({required this.authRepository})
      : super(const AsyncValue<void>.data(null));

  final AuthRepository authRepository;

  Future<void> signOut() async {
    try {
      state = const AsyncValue<void>.loading();
      await authRepository.signOut();
      state = const AsyncValue<void>.data(null);
    } catch (e, s) {
      state = AsyncValue<void>.error(e, s);
    }
  }
}

final loginViewControllerProvider =
    StateNotifierProvider.autoDispose<LoginViewController, AsyncValue>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginViewController(authRepository: authRepository);
});
