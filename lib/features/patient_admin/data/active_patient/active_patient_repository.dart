import 'package:fhir/r4.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../src.dart';

abstract class ActivePatientRepository {
  ActivePatientRepository([this.patient = const Patient()]);

  Patient patient;

  Stream<Patient> activePatientStateChanges();

  Future<void> save(bool isNewPatient);

  void update(Patient newPatient) => patient = newPatient;

  void updateFamilyName(String familyName) =>
      patient = patient.updateHumanNameFamily(familyName);

  void updateGivenNames(String givenNames) =>
      patient = patient.updateHumanNameGiven([givenNames]);

  void updateDob(DateTime newDob) => patient = patient.updateDob(newDob);

  void updateSexAtBirth(String sexAtBirth) =>
      patient = patient.updateSexAtBirth(sexAtBirth);

  void updateCountry(String country, [int index = 0]) =>
      patient = patient.updateAddressCountry(country, index);

  void updateState(String state, [int index = 0]) =>
      patient = patient.updateAddressState(state, index);

  void updateDistrict(String district, [int index = 0]) =>
      patient = patient.updateAddressDistrict(district, index);

  void updateCity(String city, [int index = 0]) =>
      patient.updateAddressCity(city, index);

  void updateLine(List<String> line, [int index = 0]) =>
      patient.updateAddressLine(line, index);
}

final activePatientRepositoryProvider =
    Provider<ActivePatientRepository>((ref) {
  final patient = FakeActivePatientRepository();
  ref.onDispose(() => patient.dispose());
  return patient;
});

final activePatientStateChangesProvider =
    StreamProvider.autoDispose<Patient>((ref) {
  final activePatientRepository = ref.watch(activePatientRepositoryProvider);
  return activePatientRepository.activePatientStateChanges();
});
