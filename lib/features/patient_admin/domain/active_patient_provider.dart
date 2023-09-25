import 'package:fhir/r4.dart';
import 'package:chronicle/src.dart';
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
    final Patient oldPatient = state;
    final HumanName oldName = oldPatient.name?.first ?? const HumanName();
    final HumanName newName = oldName.copyWith(family: familyName);
    final Patient newPatient = oldPatient.copyWith(name: [newName]);
    state = newPatient;
  }

  void updateGivenNames(String givenNames) {
    final Patient oldPatient = state;
    final HumanName oldName = oldPatient.name?.first ?? const HumanName();
    final HumanName newName = oldName.copyWith(given: givenNames.split(' '));
    final Patient newPatient = oldPatient.copyWith(name: [newName]);
    state = newPatient;
  }

  void updateDob(DateTime newDob) {
    final Patient oldPatient = state;
    final Patient newPatient = oldPatient.copyWith(birthDate: FhirDate(newDob));
    state = newPatient;
  }

  void updateSexAtBirth(String sexAtBirth) {
    final Patient oldPatient = state;
    final Patient newPatient =
        oldPatient.copyWith(gender: FhirCode(sexAtBirth));
    state = newPatient;
  }

  Future<void> save(bool isNewPatient) async {
    final oldPatient = state.copyWith();
    ref.read(savePatientProvider(true, state)).whenData((data) {
      if (oldPatient != data) {
        state = data;
        ref.read(patientListProvider.notifier).addOrUpdatePatient(data);
      }
    });
  }
}
