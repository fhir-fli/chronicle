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
        actions: const [LogoutIconButton()],
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
                  return Scrollbar(
                    thumbVisibility: true,
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        final patient = ref
                            .watch(patientsRepositoryProvider)
                            .list
                            .patients
                            .elementAt(index);
                        return PatientCard(patient, () {
                          ref
                              .watch(activePatientRepositoryProvider)
                              .update(patient);
                          context.goNamed(Routes.editPatient.name);
                        });
                      },
                      itemCount: ref
                          .watch(patientsRepositoryProvider)
                          .list
                          .patients
                          .length,
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
            ref.watch(activePatientRepositoryProvider).update(
                  Patient(
                    identifier: [
                      Identifier(
                        value: newIdString(),
                        use: IdentifierUse.official,
                        type: const CodeableConcept(
                            text: 'Old Identification Number'),
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
