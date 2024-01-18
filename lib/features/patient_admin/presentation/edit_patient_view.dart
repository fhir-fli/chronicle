import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vida/ui/common_widgets/home_app_bar.dart';

import '../../../src.dart';

class EditPatientView extends ConsumerWidget {
  const EditPatientView(this.isNewPatient, {super.key});

  final bool isNewPatient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patient = ref.watch(activePatientRepositoryProvider).patient;
    bool emptyAddress = patient?.address == null || patient!.address!.isEmpty;
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(
          IconButton(
            onPressed: () {
              context.goNamed(Routes.patients.name);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextInputField(
                    patient?.name?.first.family ?? '',
                    'Family Name',
                    (String s) => ref
                        .read(activePatientRepositoryProvider)
                        .updateFamilyName(s)),
                const Gap(12.0),
                TextInputField(
                    patient?.name?.first.given?.join(' ') ?? '',
                    'Given Names',
                    (String s) => ref
                        .read(activePatientRepositoryProvider)
                        .updateGivenNames(s)),
                const Gap(12.0),
                DateInputField(patient?.birthDate?.valueDateTime, 'Birthdate',
                    (String s) {
                  final DateTime? dob = DateTime.tryParse(s);
                  if (dob != null) {
                    ref.read(activePatientRepositoryProvider).updateDob(dob);
                  }
                }),
                const Gap(12.0),
                Row(
                  children: [
                    DropdownInputField(
                        oldValue: patient?.gender.toString(),
                        hint: 'Sex at Birth',
                        items: const [
                          'male',
                          'female',
                          'other',
                          'unknown',
                        ],
                        update: (String s) => ref
                            .read(activePatientRepositoryProvider)
                            .updateSexAtBirth(s)),
                  ],
                ),
                const Gap(24.0),
                TextInputField(
                    emptyAddress ? '' : patient.address![0].country ?? '',
                    'Country',
                    (String s) => ref
                        .read(activePatientRepositoryProvider)
                        .updateCountry(s)),
                const Gap(12.0),
                TextInputField(
                    emptyAddress ? '' : patient.address![0].state ?? '',
                    'Province / State',
                    (String s) => ref
                        .read(activePatientRepositoryProvider)
                        .updateState(s)),
                const Gap(12.0),
                TextInputField(
                    emptyAddress ? '' : patient.address![0].district ?? '',
                    'District',
                    (String s) => ref
                        .read(activePatientRepositoryProvider)
                        .updateDistrict(s)),
                const Gap(12.0),
                TextInputField(
                    emptyAddress ? '' : patient.address![0].city ?? '',
                    'Commune / City',
                    (String s) => ref
                        .read(activePatientRepositoryProvider)
                        .updateCity(s)),
                const Gap(12.0),
                TextInputField(
                    emptyAddress
                        ? ''
                        : patient.address![0].line?.join(' ') ?? '',
                    'Village / Street Address',
                    (String s) => ref
                        .read(activePatientRepositoryProvider)
                        .updateLine([s])),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ref.read(activePatientRepositoryProvider).save(isNewPatient);
            context.goNamed(Routes.patientChart.name);
          },
          label: const Text('Save Changes'),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}
