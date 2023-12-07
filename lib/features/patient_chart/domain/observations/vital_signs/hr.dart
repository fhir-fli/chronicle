import 'package:fhir/r4.dart';

import 'vs_codeable_concept.dart';

Observation getHr(int hr) => Observation(
      category: [vsCodeableConcept],
      code: CodeableConcept(
        coding: [
          Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('8867-4'),
            display: 'Heart rate',
          ),
          Coding(
            system: FhirUri(
                'http://fhir.mimic.mit.edu/CodeSystem/chartevents-d-items'),
            code: FhirCode('220045'),
            display: 'Heart Rate',
          ),
        ],
        text: 'Heart Rate',
      ),
      valueQuantity: Quantity(
        unit: 'bpm',
        system: FhirUri('http://fhir.mimic.mit.edu/CodeSystem/units'),
        code: FhirCode('bpm'),
        value: FhirDecimal(hr),
      ),
    );
