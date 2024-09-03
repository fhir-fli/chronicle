import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../src.dart';

abstract class PatientsRepository {
  Stream<Patients> patientsStateChanges();
  Patients get list;
  Future<void> getPatients();
  int index = 0;

  void nextIndex() {
    if (list.patients.isEmpty || index == list.patients.length - 1) {
      index = 0;
    } else {
      index++;
    }
  }

  void previousIndex() {
    if (list.patients.isEmpty) {
      index = 0;
    } else if (index == 0) {
      index = list.patients.length - 1;
    } else {
      index--;
    }
  }
}

final patientsRepositoryProvider = Provider<PatientsRepository>((ref) {
  final patients = FakePatientsRepository();
  ref.onDispose(() => patients.dispose());
  return patients;
});

final patientsStateChangesProvider =
    StreamProvider.autoDispose<Patients>((ref) {
  final patientsRepository = ref.watch(patientsRepositoryProvider);
  return patientsRepository.patientsStateChanges();
});
