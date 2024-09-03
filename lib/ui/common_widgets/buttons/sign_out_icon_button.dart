import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../src.dart';

class SignOutIconButton extends ConsumerWidget {
  const SignOutIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => IconButton(
      onPressed: () {
        ref.read(authRepositoryProvider).signOut();
        context.goNamed(Routes.login.name);
      },
      icon: const Icon(Icons.logout));
}
