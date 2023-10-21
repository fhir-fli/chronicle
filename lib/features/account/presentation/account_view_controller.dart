import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vida/src.dart';

class AccountViewController extends StateNotifier<AsyncValue<void>> {
  AccountViewController({required this.authRepository})
      : super(const AsyncValue<void>.data(null));

  final AuthRepository authRepository;

  Future<bool> logOut() => signOut();

  Future<bool> signOut() async {
    try {
      state = const AsyncValue<void>.loading();
      await authRepository.signOut();
      state = const AsyncValue<void>.data(null);
      return true;
    } catch (e, s) {
      state = AsyncValue<void>.error(e, s);
      return false;
    }
  }
}

final accountViewControllerProvider =
    StateNotifierProvider.autoDispose<AccountViewController, AsyncValue<void>>(
        (ref) {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return AccountViewController(authRepository: authRepository);
});
