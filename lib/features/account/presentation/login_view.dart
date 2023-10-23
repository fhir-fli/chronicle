import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../src.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      context.loc.signIn,
                      style: const TextStyle(fontSize: 24),
                    ),
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
                    Consumer(
                      builder: (context, ref, child) {
                        return StyledOvalButton(
                          percentWidth: .8,
                          heightMin: 40,
                          widthBreakPoint: 300,
                          label: context.loc.login,
                          onPressed: () async {
                            await ref
                                .read(authRepositoryProvider)
                                .signInWithEmailAndPassword(
                                  // TODO(Dokotela): change this back when ready for real authentication
                                  usernameController.text,
                                  passwordController.text,
                                );
                            ref.read(patientsRepositoryProvider).getPatients();
                            if (context.mounted) {
                              context.goNamed(Routes.patients.name);
                            }
                          },
                        );
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
