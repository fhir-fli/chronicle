import 'package:fhir/r4.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class ActivePatientRepository {
  final _patientState = InMemoryStore<Patient?>(null);

  Stream<Patient?> patientStateChanges() => _patientState.stream;

  Patient? get patient => _patientState.value;

  void dispose() => _patientState.close();

  void setActivePatient(Patient? patient) => _patientState.value = patient;

  void update(Patient newPatient) => setActivePatient(newPatient);

  void updateFamilyName(String familyName) => _patientState.value =
      _patientState.value?.updateHumanNameFamily(familyName);

  void updateGivenNames(String givenNames) => _patientState.value =
      _patientState.value?.updateHumanNameGiven([givenNames]);

  void updateDob(DateTime newDob) =>
      _patientState.value = _patientState.value?.updateDob(newDob);

  void updateSexAtBirth(String sexAtBirth) =>
      _patientState.value = _patientState.value?.updateSexAtBirth(sexAtBirth);

  void updateCountry(String country, [int index = 0]) => _patientState.value =
      _patientState.value?.updateAddressCountry(country, index);

  void updateState(String state, [int index = 0]) => _patientState.value =
      _patientState.value?.updateAddressState(state, index);

  void updateDistrict(String district, [int index = 0]) => _patientState.value =
      _patientState.value?.updateAddressDistrict(district, index);

  void updateCity(String city, [int index = 0]) =>
      _patientState.value = _patientState.value?.updateAddressCity(city, index);

  void updateLine(List<String> line, [int index = 0]) =>
      _patientState.value = _patientState.value?.updateAddressLine(line, index);

  Future<void> save(bool isNewPatient) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

final activePatientRepositoryProvider =
    Provider<ActivePatientRepository>((ref) {
  final patient = ActivePatientRepository();
  ref.onDispose(() => patient.dispose());
  return patient;
});

final activePatientStateChangesProvider =
    StreamProvider.autoDispose<Patient?>((ref) {
  final activePatientRepository = ref.watch(activePatientRepositoryProvider);
  return activePatientRepository.patientStateChanges();
});
