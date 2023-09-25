import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src.dart';

enum Routes {
  login,
  patients,
  editPatient,
  newPatient,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: Routes.login.name,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/patients',
      name: Routes.patients.name,
      builder: (context, state) => const PatientListView(),
      routes: [
        GoRoute(
          path: 'edit-patient',
          name: Routes.editPatient.name,
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: EditPatientView(false),
          ),
        ),
        GoRoute(
          path: 'new-patient',
          name: Routes.newPatient.name,
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: EditPatientView(true),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/patient-chart',
      name: Routes.patients.name,
      builder: (context, state) => const PatientListView(),
      routes: [
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
