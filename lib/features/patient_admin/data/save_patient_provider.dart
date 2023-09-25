import 'dart:convert';

import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src.dart';

part 'save_patient_provider.g.dart';

@riverpod
class SavePatient extends _$SavePatient {
  @override
  Future<Patient> build(bool isNewPatient, Patient patient) async {
    final username = ref.read(loginProvider.notifier).username;
    final password = ref.read(loginProvider.notifier).password;
    String basicAuth =
        "Basic ${base64.encode(utf8.encode('$username:$password'))}";

    FhirRequest request = isNewPatient
        ? FhirRequest.create(base: Uri.parse(endpoint), resource: patient)
        : FhirRequest.update(base: Uri.parse(endpoint), resource: patient);
    try {
      final Resource response =
          await request.request(headers: {'Authorization': basicAuth});

      print(response.toJson());

      if (response is Patient) {
        return response;
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    return patient;
  }
}
