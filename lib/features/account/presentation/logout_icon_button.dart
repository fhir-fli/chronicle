import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class LogoutIconButton extends ConsumerWidget {
  const LogoutIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(accountViewControllerProvider,
        (previousState, state) {
      if (!state.isLoading && state.hasError) {
        showExceptionAlertDialog(
          context: context,
          title: context.loc.error,
          exception: state.error,
        );
      }
    });
    final state = ref.watch(accountViewControllerProvider);

    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: state.isLoading
          ? null
          : () async {
              final logout = await showAlertDialog(
                context: context,
                title: context.loc.areYouSure,
                cancelActionText: context.loc.cancel,
                defaultActionText: context.loc.logout,
              );
              if (logout ?? false) {
                final success = await ref
                    .read(accountViewControllerProvider.notifier)
                    .signOut();
                if (success && context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
    );
  }
}
