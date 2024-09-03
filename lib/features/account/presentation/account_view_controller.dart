import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vida/src.dart';

class AccountViewController extends StateNotifier<AsyncValue> {
  AccountViewController({required this.authRepository})
      : super(const AsyncValue.data(null));

  final AuthRepository authRepository;

  Future<bool> logOut() => signOut();

  Future<bool> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.signOut());
    return !state.hasError;
  }
}

final accountViewControllerProvider =
    StateNotifierProvider.autoDispose<AccountViewController, AsyncValue>((ref) {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return AccountViewController(authRepository: authRepository);
});
