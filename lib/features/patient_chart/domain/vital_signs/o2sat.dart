import 'package:fhir/r4.dart';

import 'vs_codeable_concept.dart';

/// TODO(Dokotela): what range of normal?
Observation getO2Sat(int o2Sat) => Observation(
      category: [vsCodeableConcept],
      code: CodeableConcept(
        coding: [
          Coding(
            system: FhirUri('urn:iso:std:iso:11073:10101'),
            code: FhirCode('150456'),
            display: 'MDC_PULS_OXIM_SAT_O2',
          ),
          Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('59408-5'),
            display: 'Oxygen saturation in Arterial blood by Pulse oximetry',
          ),
          Coding(
              system: FhirUri(
                  'http://fhir.mimic.mit.edu/CodeSystem/chartevents-d-items'),
              code: FhirCode('220277'),
              display: 'O2 saturation pulseoxymetry'),
        ],
        text: 'Temperature',
      ),
      valueQuantity: Quantity(
        unit: '%',
        system: FhirUri('http://fhir.mimic.mit.edu/CodeSystem/units'),
        code: FhirCode('%'),
        value: FhirDecimal(o2Sat),
      ),
    );
