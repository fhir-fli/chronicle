import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src.dart';

enum Routes {
  login,
  patients,
  newPatient,
  patientChart,
  editPatient,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: Routes.login.name,
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: '/patients',
      name: Routes.patients.name,
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: PatientListView(),
      ),
    ),
    GoRoute(
      path: '/patient-chart',
      name: Routes.patientChart.name,
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: PatientChartView(),
      ),
      routes: [
        GoRoute(
          path: 'new-patient',
          name: Routes.newPatient.name,
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: EditPatientView(true),
          ),
        ),
        GoRoute(
          path: 'edit-patient',
          name: Routes.editPatient.name,
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: EditPatientView(false),
          ),
        ),
      ],
    ),
  ],
);
