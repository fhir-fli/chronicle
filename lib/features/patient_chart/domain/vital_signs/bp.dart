import 'package:fhir/r4.dart';

import 'vs_codeable_concept.dart';

CodeableConcept _sbpCodeableConcept() => CodeableConcept(
      coding: [
        Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('8480-6'),
            display: 'Systolic blood pressure'),
        Coding(
            system: FhirUri('http://snomed.info/sct'),
            code: FhirCode('271649006'),
            display: 'Systolic blood pressure'),
        Coding(
            system: FhirUri(
                'http://fhir.mimic.mit.edu/CodeSystem/chartevents-d-items'),
            code: FhirCode('220179'),
            display: 'Non Invasive Blood Pressure systolic'),
      ],
    );

CodeableConcept _dbpCodeableConcept() => CodeableConcept(
      coding: [
        Coding(
          system: FhirUri('http://loinc.org'),
          code: FhirCode('8462-4'),
          display: 'Diastolic blood pressure',
        ),
        Coding(
          system: FhirUri('http://snomed.info/sct'),
          code: FhirCode('271650006'),
          display: 'Diastolic blood pressure',
        ),
        Coding(
          system: FhirUri(
              'http://fhir.mimic.mit.edu/CodeSystem/chartevents-d-items'),
          code: FhirCode('220180'),
          display: 'Non Invasive Blood Pressure diastolic',
        ),
      ],
    );

Quantity _bpQuantity(int bp) => Quantity(
      unit: 'mmHg',
      system: FhirUri('http://fhir.mimic.mit.edu/CodeSystem/units'),
      code: FhirCode('mmHg'),
      value: FhirDecimal(bp),
    );

/// TODO(Dokotela): what happens when only one or the other is entered?
Observation getBp(int systolic, int diastolic) => Observation(
      category: [vsCodeableConcept],
      code: CodeableConcept(
        coding: [
          Coding(
            system: FhirUri('http://loinc.org'),
            code: FhirCode('85354-9'),
            display: 'Blood pressure panel with all children optional',
          ),
        ],
        text: 'Blood Pressure',
      ),
      component: [
        ObservationComponent(
            code: _sbpCodeableConcept(), valueQuantity: _bpQuantity(systolic)),
        ObservationComponent(
            code: _dbpCodeableConcept(), valueQuantity: _bpQuantity(diastolic)),
      ],
    );
