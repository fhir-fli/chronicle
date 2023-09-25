import 'package:fhir/r4.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src.dart';

part 'patient_list_provider.g.dart';

@riverpod
class PatientList extends _$PatientList {
  int index = 0;

  @override
  Set<Patient> build() => {};

  Future<void> getPatients() async {
    state = await requestPatientList(ref.read(loginProvider.notifier).username,
        ref.read(loginProvider.notifier).password);
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

  void addOrUpdatePatient(Patient newPatient) {
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
