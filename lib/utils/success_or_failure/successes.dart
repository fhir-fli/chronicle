import 'success_or_failure.dart';

class SuccessBool extends VidaSuccess {
  final bool value;
  const SuccessBool(this.value);
}

class SuccessString extends VidaSuccess {
  final String value;
  const SuccessString(this.value);
}
