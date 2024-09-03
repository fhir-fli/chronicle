import 'package:fhir/r4.dart';

import 'vs_codeable_concept.dart';

Observation getRr(int rr) => Observation(
      category: [vsCodeableConcept],
      code: CodeableConcept(
        coding: [
          Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('9279-1'),
            display: 'Respiratory rate',
          ),
          Coding(
              system: FhirUri(
                  'http://fhir.mimic.mit.edu/CodeSystem/chartevents-d-items'),
              code: FhirCode('220210'),
              display: 'Respiratory Rate')
        ],
        text: 'Respiratory Rate',
      ),
      valueQuantity: Quantity(
        unit: 'insp/min',
        system: FhirUri('http://fhir.mimic.mit.edu/CodeSystem/units'),
        code: FhirCode('insp/min'),
        value: FhirDecimal(rr),
      ),
    );
