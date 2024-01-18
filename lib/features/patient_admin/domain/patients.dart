import 'package:fhir/r4.dart';

class Patients {
  Patients([this.patients = const {}]);

  final Set<Patient> patients;

  void addPatients(List<Patient> newPatients) {
    patients.addAll(newPatients);
  }

  void addOrUpdatePatient(Patient newPatient) {
    if (patients.isEmpty) {
      patients.add(newPatient);
    } else {
      final index = patients
          .toList()
          .indexWhere((element) => element.fhirId == newPatient.fhirId);
      if (index != -1) {
        patients.removeWhere((element) => element.fhirId == newPatient.fhirId);
      }
      patients.add(newPatient);
    }
  }

  Patient? getPatient(String fhirId) {
    final int index =
        patients.toList().indexWhere((element) => element.fhirId == fhirId);
    if (index == -1) {
      return null;
    } else {
      return patients.elementAt(index);
    }
  }
}
