import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class PatientChartView extends ConsumerWidget {
  const PatientChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(patientListProvider).forEach((element) {
      print(element.name?.first.family);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.goNamed(Routes.patients.name);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(loginProvider.notifier).logout();
                context.goNamed(Routes.login.name);
              },
              icon: const Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                context.goNamed(Routes.editPatient.name);
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text('PatientChartView'),
            PatientCard(ref.read(activePatientProvider), null),
          ],
        ),
      ),
    );
  }
}
