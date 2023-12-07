import 'package:fhir/r4.dart';

abstract class FhirDbRepository {
  FhirDbRepository();

  /// Get a specific resource from the database
  Future<T?> get<T>(FhirId id);

  /// Get the list of specific type of resource in the database
  Future<List<T>> getAll<T>();

  /// Get all resources that are stored in the database
  Future<List<Resource>> getAllResources();

  /// Add a resource to the database
  Future<T?> save<T>(Resource resource);

  /// Add a list of resources to the database
  Future<List<T>> saveAll<T>(List<Resource> resources);
}
