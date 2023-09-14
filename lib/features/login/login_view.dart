import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../src.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(loginProvider);
    final AppLocalizations? labels = LocaleUtil().getLabels(context);
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
                    Text(labels?.signIn ?? ''),
                    Gap(doubleByHeight(context, 30)),
                    StyledOvalTextFormField(
                      prefixIcon: const Icon(Icons.email),
                      label: labels?.username,
                      controller: usernameController,
                    ),
                    Gap(doubleByHeight(context, 30)),
                    StyledOvalTextFormField(
                      prefixIcon: const Icon(Icons.lock),
                      label: labels?.password,
                      controller: passwordController,
                      obscureText: true,
                    ),
                    Gap(doubleByHeight(context, 60)),
                    StyledOvalButton(
                      label: labels?.login,
                      onPressed: () async {
                        ref.read(loginProvider.notifier).setUsernameAndPassword(
                              usernameController.text,
                              passwordController.text,
                            );
                        await ref
                            .watch(patientListProvider.notifier)
                            .getPatients();
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PatientListView()),
                          );
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
