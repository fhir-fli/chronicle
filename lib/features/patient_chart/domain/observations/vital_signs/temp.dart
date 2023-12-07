import 'package:fhir/r4.dart';

import 'vs_codeable_concept.dart';

/// TODO(Dokotela): what kind of temps?
/// Should we allow Fahrenheit?
Observation getTemp(double temp) => Observation(
      category: [vsCodeableConcept],
      code: CodeableConcept(
        coding: [
          Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('8310-5'),
            display: 'Body temperature',
          ),
          Coding(
            system: FhirUri('http://snomed.info/sct'),
            code: FhirCode('56342008'),
            display: 'Temperature taking',
          ),
          Coding(
              system: FhirUri(
                  'http://fhir.mimic.mit.edu/CodeSystem/chartevents-d-items'),
              code: FhirCode('223762'),
              display: 'Temperature Celsius'),
        ],
        text: 'Temperature',
      ),
      valueQuantity: Quantity(
        unit: '°C',
        system: FhirUri('http://fhir.mimic.mit.edu/CodeSystem/units'),
        code: FhirCode('°C'),
        value: FhirDecimal(temp),
      ),
    );
