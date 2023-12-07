import 'package:fhir/r4.dart';
import 'package:fhir_db/r4.dart';

import 'resource_repository.dart';

class FhirDbRespository extends ResourceListRepository {
  final FhirDbDao _fhirDbDao = FhirDbDao();

  @override
  Stream<List<Resource>> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> history() {
    // TODO: implement history
    throw UnimplementedError();
  }

  @override
  Future<void> patch() {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Stream<List<Resource>> search() {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future<void> update() {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> vRead() {
    // TODO: implement vRead
    throw UnimplementedError();
  }
}
