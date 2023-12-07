import 'package:fhir/r4.dart';

import 'vs_codeable_concept.dart';

Observation getWeight(double weight) => Observation(
      category: [vsCodeableConcept],
      code: CodeableConcept(
        coding: [
          Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('29463-7'),
            display: 'Body Weight',
          ),
          Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('3141-9'),
            display: 'Body weight Measured',
          ),
          Coding(
            system: FhirUri('http://snomed.info/sct'),
            code: FhirCode('27113001'),
            display: 'Body weight',
          ),
        ],
        text: 'Body weight',
      ),
      valueQuantity: Quantity(
        unit: 'kg',
        system: FhirUri('http://unitsofmeasure.org'),
        code: FhirCode('kg'),
        value: FhirDecimal(weight),
      ),
    );
