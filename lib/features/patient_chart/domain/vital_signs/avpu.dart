import 'package:fhir/r4.dart';

enum AVPU { alert, voice, pain, unresponsive }

final _avpuCodeableConcept = CodeableConcept(
  coding: [
    Coding(
      system: FhirUri('http://loinc.org'),
      code: FhirCode('11454-6'),
      display: 'Level of Responsiveness (AVPU)',
    ),
  ],
  text: 'Level of Responsiveness (AVPU)',
);

Observation? getAvpu(AVPU avpu) {
  switch (avpu) {
    case AVPU.alert:
      return Observation(
        code: _avpuCodeableConcept,
        valueCodeableConcept: CodeableConcept(
          coding: [
            Coding(
              system: FhirUri('https://loinc.org'),
              code: FhirCode('LA6703-8'),
              display: 'Alert',
            ),
          ],
        ),
      );
    case AVPU.voice:
      return Observation(
        code: _avpuCodeableConcept,
        valueCodeableConcept: CodeableConcept(
          coding: [
            Coding(
              system: FhirUri('https://loinc.org'),
              code: FhirCode('LA6704-6'),
              display: 'Voice',
            ),
          ],
        ),
      );
    case AVPU.pain:
      return Observation(
        code: _avpuCodeableConcept,
        valueCodeableConcept: CodeableConcept(
          coding: [
            Coding(
              system: FhirUri('https://loinc.org'),
              code: FhirCode('LA6705-3'),
              display: 'Pain',
            ),
          ],
        ),
      );
    case AVPU.unresponsive:
      return Observation(
        code: _avpuCodeableConcept,
        valueCodeableConcept: CodeableConcept(
          coding: [
            Coding(
              system: FhirUri('https://loinc.org'),
              code: FhirCode('LA6706-1'),
              display: 'Unresponsive',
            ),
          ],
        ),
      );
  }
}
