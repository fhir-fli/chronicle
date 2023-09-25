import 'dart:convert';

import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';

import '../../../src.dart';

Future<Patient> savePatientOnServer(
    {required bool isNewPatient,
    required Patient patient,
    required String username,
    required String password}) async {
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
