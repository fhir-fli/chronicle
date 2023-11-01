import 'package:fhir/r4.dart';

final vsCodeableConcept = CodeableConcept(
  coding: [
    Coding(
      system:
          FhirUri('http://terminology.hl7.org/CodeSystem/observation-category'),
      code: FhirCode('vital-signs'),
      display: 'Vital Signs',
    ),
    Coding(
      system:
          FhirUri('http://fhir.mimic.mit.edu/CodeSystem/observation-category'),
      code: FhirCode('Routine Vital Signs'),
      display: 'Routine Vital Signs',
    ),
  ],
  text: 'Vital Signs',
);
