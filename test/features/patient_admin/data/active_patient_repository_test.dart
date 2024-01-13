import 'package:fhir/r4.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vida/src.dart';

void main() {
  group('ActivePatientRepository', () {
    late ActivePatientRepository repository;

    setUp(() {
      repository = ActivePatientRepository();
    });

    tearDown(() {
      repository.dispose();
    });

    test('Setting and getting active patient', () {
      const patient = Patient(
          // Replace with necessary patient data for testing
          // Example: id: '123', name: 'John Doe', ...
          );

      repository.setActivePatient(patient);

      expect(repository.patient, equals(patient));
    });

    test('Updating patient information', () {
      const initialPatient = Patient(
          // Replace with initial patient data for testing
          );
      repository.setActivePatient(initialPatient);

      // Perform updates
      repository.updateFamilyName('Doe');
      repository.updateGivenNames('John');
      repository.updateDob(DateTime(1990, 5, 20));
      repository.updateSexAtBirth('Male');
      repository.updateCountry('USA');
      repository.updateState('New York');
      repository.updateDistrict('Manhattan');
      repository.updateCity('New York City');
      repository.updateLine(['123 Street']);

      // Fetch updated patient
      final updatedPatient = repository.patient;

      expect(updatedPatient?.name?.first.family, equals('Doe'));
      expect(updatedPatient?.name?.first.given, equals(['John']));
      expect(updatedPatient?.birthDate?.valueDateTime,
          equals(DateTime(1990, 5, 20)));
      expect(updatedPatient?.gender.toString(), equals('Male'));
      expect(updatedPatient?.address?.first.country, equals('USA'));
      expect(updatedPatient?.address?[0].state, equals('New York'));
      expect(updatedPatient?.address?[0].district, equals('Manhattan'));
      expect(updatedPatient?.address?[0].city, equals('New York City'));
      expect(updatedPatient?.address?[0].line, equals(['123 Street']));
    });

    test('Saving patient information', () async {
      const patient = Patient(
          // Replace with necessary patient data for testing
          );
      repository.setActivePatient(patient);

      await repository.save(true); // Simulate saving

      // Add assertions if needed for the save operation
    });

    test('patientStateChanges emits when patient is updated', () {
      expect(repository.patientStateChanges(), emits(null));

      repository.setActivePatient(Patient(
        name: [
          const HumanName(family: 'Doe', given: ['John'])
        ],
        birthDate: FhirDate(DateTime(1980, 1, 1)),
        gender: FhirCode('male'),
        address: [
          const Address(
            country: 'USA',
            state: 'CA',
            district: 'San Francisco',
            city: 'San Francisco',
            line: ['123 Main St'],
          ),
        ],
      ));

      expect(
        repository.patientStateChanges(),
        emits(Patient(
          name: [
            const HumanName(family: 'Doe', given: ['John'])
          ],
          birthDate: FhirDate(DateTime(1980, 1, 1)),
          gender: FhirCode('male'), // Use FhirCode instead of a string
          address: [
            const Address(
              country: 'USA',
              state: 'CA',
              district: 'San Francisco',
              city: 'San Francisco',
              line: ['123 Main St'],
            ),
          ],
        )),
      );
    });

    test('patient returns the current patient', () {
      repository.setActivePatient(Patient(
        name: [
          const HumanName(family: 'Doe', given: ['John'])
        ],
        birthDate: FhirDate(DateTime(1980, 1, 1)),
        gender: FhirCode('male'), // Use FhirCode instead of a string
        address: [
          const Address(
            country: 'USA',
            state: 'CA',
            district: 'San Francisco',
            city: 'San Francisco',
            line: ['123 Main St'],
          ),
        ],
      ));

      expect(
        repository.patient,
        Patient(
          name: [
            const HumanName(family: 'Doe', given: ['John'])
          ],
          birthDate: FhirDate(DateTime(1980, 1, 1)),
          gender: FhirCode('male'), // Use FhirCode instead of a string
          address: [
            const Address(
              country: 'USA',
              state: 'CA',
              district: 'San Francisco',
              city: 'San Francisco',
              line: ['123 Main St'],
            ),
          ],
        ),
      );
    });

    test('setActivePatient updates the current patient', () {
      repository.setActivePatient(Patient(
        name: [
          const HumanName(family: 'Doe', given: ['John'])
        ],
        birthDate: FhirDate(DateTime(1980, 1, 1)),
        gender: FhirCode('male'), // Use FhirCode instead of a string
        address: [
          const Address(
            country: 'USA',
            state: 'CA',
            district: 'San Francisco',
            city: 'San Francisco',
            line: ['123 Main St'],
          ),
        ],
      ));

      repository.setActivePatient(Patient(
        name: [
          const HumanName(family: 'Smith', given: ['Jane', 'Mary'])
        ],
        birthDate: FhirDate(DateTime(1985, 1, 1)),
        gender: FhirCode('female'), // Use FhirCode instead of a string
        address: [
          const Address(
            country: 'Canada',
            state: 'Ontario', // Fix state abbreviation
            district: 'Toronto',
            city: 'Toronto',
            line: ['456 Queen St'],
          ),
        ],
      ));

      expect(
        repository.patient,
        Patient(
          name: [
            const HumanName(family: 'Smith', given: ['Jane', 'Mary'])
          ],
          birthDate: FhirDate(DateTime(1985, 1, 1)),
          gender: FhirCode('female'), // Use FhirCode instead of a string
          address: [
            const Address(
              country: 'Canada',
              state: 'Ontario', // Fix state abbreviation
              district: 'Toronto',
              city: 'Toronto',
              line: ['456 Queen St'],
            ),
          ],
        ),
      );
    });
  });
}
