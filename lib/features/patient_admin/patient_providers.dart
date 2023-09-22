import 'dart:convert';

import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';
import 'package:chronicle/src.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_providers.g.dart';

@riverpod
class PatientList extends _$PatientList {
  int index = 0;

  @override
  Set<Patient> build() => {};

  Future<void> getPatients() async {
    final username = ref.read(loginProvider.notifier).username;
    final password = ref.read(loginProvider.notifier).password;
    String basicAuth =
        "Basic ${base64.encode(utf8.encode('$username:$password'))}";

    FhirRequest request = FhirRequest.search(
        base: Uri.parse(endpoint), type: R4ResourceType.Patient);
    try {
      final Resource response =
          await request.request(headers: {'Authorization': basicAuth});

      final Set<Patient> newPatients = {};

      if (response is Bundle) {
        for (var entry in response.entry ?? <BundleEntry>[]) {
          if (entry.resource is Patient) {
            newPatients.add(entry.resource as Patient);
          }
        }
        state = newPatients;
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  void addPatients(List<Patient> newPatients) {
    final Set<Patient> oldState = state.toSet();
    if (oldState.isEmpty) {
      state = newPatients.toSet();
    } else {
      oldState.addAll(newPatients);
      state = oldState;
    }
  }

  void addPatient(Patient newPatient) {
    Set<Patient> oldState = state.toSet();
    if (oldState.isEmpty) {
      state = {newPatient};
    } else {
      final index = oldState
          .toList()
          .indexWhere((element) => element.fhirId == newPatient.fhirId);
      if (index != -1) {
        oldState.removeWhere((element) => element.fhirId == newPatient.fhirId);
        oldState = {
          ...oldState.toList().sublist(0, index),
          newPatient,
          ...oldState.toList().sublist(index)
        };
      } else {
        oldState.add(newPatient);
      }
      state = oldState;
    }
  }

  void nextIndex() {
    if (state.isEmpty || index == state.length - 1) {
      index = 0;
    } else {
      index++;
    }
  }

  void previousIndex() {
    if (state.isEmpty) {
      index = 0;
    } else if (index == 0) {
      index = state.length - 1;
    } else {
      index--;
    }
  }

  Patient? getPatient(String fhirId) {
    final int index =
        state.toList().indexWhere((element) => element.fhirId == fhirId);
    if (index == -1) {
      return null;
    } else {
      return state.elementAt(index);
    }
  }
}

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
    final username = ref.read(loginProvider.notifier).username;
    final password = ref.read(loginProvider.notifier).password;
    String basicAuth =
        "Basic ${base64.encode(utf8.encode('$username:$password'))}";

    FhirRequest request = isNewPatient
        ? FhirRequest.create(base: Uri.parse(endpoint), resource: state)
        : FhirRequest.update(base: Uri.parse(endpoint), resource: state);
    try {
      final Resource response =
          await request.request(headers: {'Authorization': basicAuth});

      print(response.toJson());

      if (response is Patient) {
        ref.read(patientListProvider.notifier).addPatient(response);
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
