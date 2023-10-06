import 'package:fhir/r4.dart';
import 'package:vida/src.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_patient_provider.g.dart';

@riverpod
class ActivePatient extends _$ActivePatient {
  @override
  Patient build() => const Patient();

  void update(Patient newPatient) {
    state = newPatient;
  }

  void updateFamilyName(String familyName) {
    state = state.updateFamilyName(familyName);
  }

  void updateGivenNames(String givenNames) {
    state = state.updateGivenNames(givenNames);
  }

  void updateDob(DateTime newDob) {
    state = state.updateDob(newDob);
  }

  void updateSexAtBirth(String sexAtBirth) {
    state = state.updateSexAtBirth(sexAtBirth);
  }

  void updateCountry(String country, [int index = 0]) {
    state = state.updateCountry(country, index);
  }

  void updateState(String state, [int index = 0]) {
    this.state = this.state.updateState(state, index);
  }

  void updateDistrict(String district, [int index = 0]) {
    state = state.updateDistrict(district, index);
  }

  void updateCity(String city, [int index = 0]) {
    state = state.updateCity(city, index);
  }

  void updateLine(List<String> line, [int index = 0]) {
    state = state.updateLine(line, index);
  }

  Future<void> save(bool isNewPatient) async {
    final oldPatient = state.copyWith();
    final newPatient = await savePatientOnServer(
      isNewPatient: isNewPatient,
      patient: state,
      username: ref.read(loginProvider.notifier).username,
      password: ref.read(loginProvider.notifier).password,
    );
    if (oldPatient != newPatient) {
      state = newPatient;
      ref.read(patientListProvider.notifier).addOrUpdatePatient(newPatient);
    }
  }
}
