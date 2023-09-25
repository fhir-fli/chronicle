import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PatientChartView extends ConsumerWidget {
  const PatientChartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.loc.patientListTitle ?? ''),
        automaticallyImplyLeading: false,
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
      body: const Center(
        child: Text('PatientChartView'),
      ),
    );
  }
}
