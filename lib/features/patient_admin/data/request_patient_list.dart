import 'dart:convert';

import 'package:vida/features/patient_admin/data/patients_fake_repository.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';

import '../../../src.dart';

Future<Set<Patient>> requestPatientList(
    String username, String password) async {
  String basicAuth =
      "Basic ${base64.encode(utf8.encode('$username:$password'))}";

  FhirRequest request = FhirRequest.search(
      base: Uri.parse(endpoint), type: R4ResourceType.Patient);
  try {
    // TODO(Dokotela): using fake repository
    final Resource response = PatientsFakeRepository().getPatients();
    // await request.request(headers: {'Authorization': basicAuth});

    final Set<Patient> newPatients = {};

    if (response is Bundle) {
      for (var entry in response.entry ?? <BundleEntry>[]) {
        if (entry.resource is Patient) {
          newPatients.add(entry.resource as Patient);
        }
      }
      return newPatients;
    }
  } catch (e, s) {
    print(e);
    print(s);
  }
  return {};
}
