import 'dart:math';

import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(context.loc.patientListTitle),
        actions: const [SignOutIconButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
        child: Column(
          children: [
            Center(
              child: StyledOvalTextFormField(
                prefixIcon: const Icon(Icons.search),
                label: context.loc.searchPatient,
                controller: searchController,
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final ScrollController scrollController = ScrollController();
                  final patientList = ref.watch(patientListProvider);
                  if (patientList.isEmpty) {
                    ref.read(patientListProvider.notifier).getPatients();
                  }
                  return Scrollbar(
                    thumbVisibility: true,
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) =>
                          PatientCard(patientList.elementAt(index), () {
                        ref
                            .watch(activePatientProvider.notifier)
                            .update(patientList.elementAt(index));
                        context.goNamed(Routes.editPatient.name);
                      }),
                      itemCount: patientList.length,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => FloatingActionButton.extended(
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
      ),
    );
  }
}
