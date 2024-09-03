import 'package:rxdart/subjects.dart';

/// In Memory Store that is backed by [BehaviorSubject] from the rxdart package.
/// It is used to store the data for all of the fake repositories used in the app.
class InMemoryStore<T> {
  /// Pass in an initial value that will be used to seed the [BehaviorSubject]
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);

  /// The [BehaviorSubject] that holds the data
  final BehaviorSubject<T> _subject;

  /// The output stream that can be used to listen to the  data
  Stream<T> get stream => _subject.stream;

  /// A synchronous getter for the current value
  T get value => _subject.value;

  /// A setter for updating the value
  set value(T value) => _subject.add(value);

  /// Must be called when done with this store to avoid memory leaks
  void close() => _subject.close();
}
