import 'package:rxdart/subjects.dart';

/// An in memory store, backed by [BehaviorSubject] that can be used to store
/// the data for all fake repositories in the app
class InMemoryStore<T> {
  InMemoryStore(T initialData)
      : _subject = BehaviorSubject<T>.seeded(initialData);

  /// The [BehaviorSubject] that holds the data
  final BehaviorSubject<T> _subject;

  /// Output stream that can be used to listen to the data
  Stream<T> get stream => _subject.stream;

  /// A synchronous getter for the current value
  T get value => _subject.value;

  /// Setter for updating the value
  set value(T value) => _subject.add(value);

  /// Must call when finished with the store
  void close() => _subject.close();
}
