import 'success_or_failure.dart';

class FailureException extends VidaFailure {
  final Object exception;
  final StackTrace stackTrace;
  const FailureException(this.exception, this.stackTrace);
}

class FailureBool extends VidaFailure {
  final bool value;
  const FailureBool(this.value);
}

class FailureString extends VidaFailure {
  final String value;
  const FailureString(this.value);
}
