import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class PatientChartView extends ConsumerWidget {
  const PatientChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          const SignOutIconButton(),
          IconButton(
              onPressed: () {
                context.goNamed(Routes.editPatient.name);
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: const Center(
        child: Text('PatientChartView'),
      ),
    );
  }
}
