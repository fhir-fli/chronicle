// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$patientListHash() => r'8d5436a0c2a33a9fcdafbc6ec8f22382a5239d8e';

/// See also [PatientList].
@ProviderFor(PatientList)
final patientListProvider =
    AutoDisposeNotifierProvider<PatientList, Set<Patient>>.internal(
  PatientList.new,
  name: r'patientListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$patientListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PatientList = AutoDisposeNotifier<Set<Patient>>;
String _$activePatientHash() => r'a3f4fbc430ea2bf5f9de87ae7fad1bc0ceb1fd27';

/// See also [ActivePatient].
@ProviderFor(ActivePatient)
final activePatientProvider =
    AutoDisposeNotifierProvider<ActivePatient, Patient>.internal(
  ActivePatient.new,
  name: r'activePatientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activePatientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActivePatient = AutoDisposeNotifier<Patient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
