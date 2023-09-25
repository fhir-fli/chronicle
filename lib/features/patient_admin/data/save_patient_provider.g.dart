// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_patient_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savePatientHash() => r'83215fe08ed3cd0eca47075b4374c48ad448e98a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SavePatient
    extends BuildlessAutoDisposeAsyncNotifier<Patient> {
  late final bool isNewPatient;
  late final Patient patient;

  Future<Patient> build(
    bool isNewPatient,
    Patient patient,
  );
}

/// See also [SavePatient].
@ProviderFor(SavePatient)
const savePatientProvider = SavePatientFamily();

/// See also [SavePatient].
class SavePatientFamily extends Family<AsyncValue<Patient>> {
  /// See also [SavePatient].
  const SavePatientFamily();

  /// See also [SavePatient].
  SavePatientProvider call(
    bool isNewPatient,
    Patient patient,
  ) {
    return SavePatientProvider(
      isNewPatient,
      patient,
    );
  }

  @override
  SavePatientProvider getProviderOverride(
    covariant SavePatientProvider provider,
  ) {
    return call(
      provider.isNewPatient,
      provider.patient,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savePatientProvider';
}

/// See also [SavePatient].
class SavePatientProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SavePatient, Patient> {
  /// See also [SavePatient].
  SavePatientProvider(
    bool isNewPatient,
    Patient patient,
  ) : this._internal(
          () => SavePatient()
            ..isNewPatient = isNewPatient
            ..patient = patient,
          from: savePatientProvider,
          name: r'savePatientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savePatientHash,
          dependencies: SavePatientFamily._dependencies,
          allTransitiveDependencies:
              SavePatientFamily._allTransitiveDependencies,
          isNewPatient: isNewPatient,
          patient: patient,
        );

  SavePatientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isNewPatient,
    required this.patient,
  }) : super.internal();

  final bool isNewPatient;
  final Patient patient;

  @override
  Future<Patient> runNotifierBuild(
    covariant SavePatient notifier,
  ) {
    return notifier.build(
      isNewPatient,
      patient,
    );
  }

  @override
  Override overrideWith(SavePatient Function() create) {
    return ProviderOverride(
      origin: this,
      override: SavePatientProvider._internal(
        () => create()
          ..isNewPatient = isNewPatient
          ..patient = patient,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isNewPatient: isNewPatient,
        patient: patient,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SavePatient, Patient>
      createElement() {
    return _SavePatientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavePatientProvider &&
        other.isNewPatient == isNewPatient &&
        other.patient == patient;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isNewPatient.hashCode);
    hash = _SystemHash.combine(hash, patient.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavePatientRef on AutoDisposeAsyncNotifierProviderRef<Patient> {
  /// The parameter `isNewPatient` of this provider.
  bool get isNewPatient;

  /// The parameter `patient` of this provider.
  Patient get patient;
}

class _SavePatientProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SavePatient, Patient>
    with SavePatientRef {
  _SavePatientProviderElement(super.provider);

  @override
  bool get isNewPatient => (origin as SavePatientProvider).isNewPatient;
  @override
  Patient get patient => (origin as SavePatientProvider).patient;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
