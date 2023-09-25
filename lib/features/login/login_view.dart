import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../src.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(loginProvider);
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(doubleByPercentHeight(context, .2)),
                    Text(context.loc.signIn),
                    Gap(doubleByHeight(context, 30)),
                    StyledOvalTextFormField(
                      prefixIcon: const Icon(Icons.email),
                      label: context.loc.username,
                      controller: usernameController,
                    ),
                    Gap(doubleByHeight(context, 30)),
                    StyledOvalTextFormField(
                      prefixIcon: const Icon(Icons.lock),
                      label: context.loc.password,
                      controller: passwordController,
                      obscureText: true,
                    ),
                    Gap(doubleByHeight(context, 60)),
                    StyledOvalButton(
                      label: context.loc.login,
                      onPressed: () async {
                        ref.read(loginProvider.notifier).setUsernameAndPassword(
                              // TODO(Dokotela): change this back when ready for real authentication
                              'grey',
                              '123456',
                              // usernameController.text,
                              // passwordController.text,
                            );
                        if (context.mounted) {
                          context.goNamed(Routes.patients.name);
                        }
                      },
                    ),
                    Gap(doubleByHeight(context, 120)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
