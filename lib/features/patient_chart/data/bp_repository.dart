import 'package:fhir/r4.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'observation_repository.dart';

final _obsRepositoryProvider = Provider<ObservationRepository>((ref) {
  final obs = ObservationRepository();
  ref.onDispose(() => obs.dispose());
  return obs;
});

final bpListStateChangesProvider =
    StreamProvider.autoDispose<List<Observation>>((ref) {
  final obsRepository = ref.watch(_obsRepositoryProvider);
  return obsRepository.obsStateChanges();
});

final latestBpStateChangesProvider =
    StreamProvider.autoDispose<Observation?>((ref) {
  final obsRepository = ref.watch(_obsRepositoryProvider);
  return obsRepository.latestObs();
});
