import 'package:fhir/r4.dart';

abstract class ResourceListRepository {
  Stream<List<Resource>> read();
  Future<void> vRead();
  Future<void> update();
  Future<void> patch();
  Future<void> delete();
  Future<void> create();
  Stream<List<Resource>> search();
  Future<void> history();
}
