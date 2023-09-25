import 'dart:math';

import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../src.dart';

class PatientListView extends ConsumerWidget {
  const PatientListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientList = ref.watch(patientListProvider);
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(context.loc.patientListTitle),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(loginProvider.notifier).logout();
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LoginView();
                    },
                  ),
                  (_) => false,
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
        child: Column(
          children: [
            Center(
              child: StyledOvalTextFormField(
                prefixIcon: const Icon(Icons.search),
                label: context.loc.patientSearch,
                controller: searchController,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    PatientCard(patientList.elementAt(index), () {
                  ref
                      .watch(activePatientProvider.notifier)
                      .update(patientList.elementAt(index));
                  context.goNamed(Routes.editPatient.name);
                }),
                itemCount: patientList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(activePatientProvider.notifier).update(
                Patient(
                  identifier: [
                    Identifier(
                      fhirId: newIdString(),
                      use: IdentifierUse.official,
                      type: CodeableConcept(coding: [
                        Coding(
                            code: FhirCode(
                                '05a29f94-c0ed-11e2-94be-8c13b969e334'))
                      ], text: 'OpenMRS ID'),
                      value: '10000${Random().nextInt(10)}'
                          '${"ABCDEFGHIJKLMNOPQRSTUVWXYZ"[Random().nextInt(26)]}',
                    ),
                  ],
                ),
              );
          context.goNamed(Routes.newPatient.name);
        },
        label: const Text('New Patient'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
