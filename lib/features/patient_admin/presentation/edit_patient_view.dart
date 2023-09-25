import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class EditPatientView extends ConsumerWidget {
  const EditPatientView(this.isNewPatient, {super.key});

  final bool isNewPatient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patient = ref.watch(activePatientProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(loginProvider.notifier).logout();
                context.goNamed(Routes.login.name);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          children: [
            TextInputField(
                patient.name?.first.family ?? '',
                'Family Name',
                (String s) => ref
                    .read(activePatientProvider.notifier)
                    .updateFamilyName(s)),
            const Gap(12.0),
            TextInputField(
                patient.name?.first.given?.join(' ') ?? '',
                'Given Names',
                (String s) => ref
                    .read(activePatientProvider.notifier)
                    .updateGivenNames(s)),
            const Gap(12.0),
            DateInputField(
                patient.birthDate?.valueDateTime,
                'Birthdate',
                (String s) => ref
                    .read(activePatientProvider.notifier)
                    .updateGivenNames(s)),
            const Gap(12.0),
            DropdownInputField(
                oldValue: patient.gender.toString(),
                hint: 'Sex at Birth',
                items: const [
                  'male',
                  'female',
                  'other',
                  'unknown',
                ],
                update: (String s) => ref
                    .read(activePatientProvider.notifier)
                    .updateSexAtBirth(s)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(activePatientProvider.notifier).save(isNewPatient);
          context.goNamed(Routes.patientChart.name);
        },
        label: const Text('Save Changes'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
