import 'package:fhir/r4.dart';

import '../../../src.dart';

class ObservationRepository {
  final _obsState = InMemoryStore<List<Observation>>(<Observation>[]);

  Stream<List<Observation>> obsStateChanges() => _obsState.stream;

  Stream<Observation?> latestObs() => _obsState.stream.map((list) {
        if (list.isEmpty) {
          return null;
        } else {
          return list.last;
        }
      });

  List<Observation> get observationList => _obsState.value;

  void addObservation(Observation obs) {
    _obsState.value = [..._obsState.value, obs];
  }

  void clearObservations() {
    _obsState.value = <Observation>[];
  }

  void dispose() => _obsState.close();
}
