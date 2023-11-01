import 'package:fhir/r4.dart';

enum MuacColor { red, yellow, green }

/// TODO(Dokotela): ensure that we need to always use the right arm
final _muacCodeableConcept = CodeableConcept(
  coding: [
    Coding(
      system: FhirUri('http://loinc.org'),
      code: FhirCode('56072-2'),
      display: 'Circumference Mid upper arm - right',
    ),
  ],
  text: 'Circumference Mid upper arm - right',
);

/// TODO(Dokotela): options for passing in colors as well as measurements
Observation? getMuacByColor(MuacColor muacColor) {
  switch (muacColor) {
    case MuacColor.red:
      return Observation(
        code: _muacCodeableConcept,
        valueCodeableConcept: const CodeableConcept(
          coding: [
            Coding(
              display: 'Red',
            ),
          ],
        ),
      );
    case MuacColor.yellow:
      return Observation(
        code: _muacCodeableConcept,
        valueCodeableConcept: const CodeableConcept(
          coding: [
            Coding(
              display: 'Yellow',
            ),
          ],
        ),
      );
    case MuacColor.green:
      return Observation(
        code: _muacCodeableConcept,
        valueCodeableConcept: const CodeableConcept(
          coding: [
            Coding(
              display: 'Green',
            ),
          ],
        ),
      );
  }
}
