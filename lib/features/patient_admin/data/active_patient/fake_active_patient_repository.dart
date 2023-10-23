import 'package:fhir/r4.dart';

import '../../../../src.dart';

class FakeActivePatientRepository extends ActivePatientRepository {
  final _activePatientState = InMemoryStore<Patient>(const Patient());

  @override
  Stream<Patient> activePatientStateChanges() => _activePatientState.stream;

  Patient get activePatient => _activePatientState.value;

  @override
  Future<void> update(Patient newPatient) async {
    await Future.delayed(const Duration(seconds: 1));
    _activePatientState.value = patient;
  }

  void dispose() => _activePatientState.close();

  @override
  Future<void> save(bool isNewPatient) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
