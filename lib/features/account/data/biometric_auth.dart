import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:vida/utils/success_or_failure/success_or_failure.dart';

final LocalAuthentication auth = LocalAuthentication();

Future<bool> canUseBiometrics() async => auth.canCheckBiometrics;

Future<bool> isDeviceSupported() async => auth.isDeviceSupported();

Future<bool> biometricsAvailable() async =>
    await canUseBiometrics() || await auth.isDeviceSupported();

Future<List<BiometricType>> biometricTypes() async =>
    auth.getAvailableBiometrics();

Future<SuccessOrFailure> biometricAuth(AppLocalizations labels) async {
  try {
    if (await biometricsAvailable()) {
      final bool success = await auth.authenticate(
        localizedReason: labels.authenticateFingerprint,
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      return success ? const VidaSuccess() : FailureString(labels.unsuccessful);
    } else {
      return FailureString(labels.biometricsUnavailable);
    }
  } on PlatformException catch (e) {
    return e.code == auth_error.notAvailable
        ? FailureString(labels.biometricsUnavailable)
        : e.code == auth_error.notEnrolled
            ? FailureString(labels.biometricsNotEnrolled)
            : FailureString('${labels.error}: $e');
  } catch (exception, stackTrace) {
    return FailureException(exception, stackTrace);
  }
}
