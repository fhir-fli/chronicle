import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vida/src.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(accountViewControllerProvider,
        (previousState, state) {
      state.maybeWhen(
        error: (error, stackTrace) {
          showExceptionAlertDialog(
            context: context,
            title: context.loc.error,
            exception: error,
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.toString())));
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.account),
        actions: [
          ActionTextButton(
            text: context.loc.logout,
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
                      await ref
                          .read(accountViewControllerProvider.notifier)
                          .signOut();

                      /// TODO(Dokotela): only pop on sucess
                      Navigator.of(context).pop();
                    }
                  },
          ),
        ],
      ),
    );
  }
}
