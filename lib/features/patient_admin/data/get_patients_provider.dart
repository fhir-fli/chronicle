import 'dart:convert';

import 'package:fhir/r4.dart';
import 'package:fhir_at_rest/r4.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src.dart';

part 'get_patients_provider.g.dart';

@riverpod
class GetPatients extends _$GetPatients {
  @override
  Future<Set<Patient>> build() async {
    final username = ref.read(loginProvider.notifier).username;
    final password = ref.read(loginProvider.notifier).password;
    String basicAuth =
        "Basic ${base64.encode(utf8.encode('$username:$password'))}";

    FhirRequest request = FhirRequest.search(
        base: Uri.parse(endpoint), type: R4ResourceType.Patient);
    try {
      final Resource response =
          await request.request(headers: {'Authorization': basicAuth});

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
}
