import 'package:at_app_flutter/at_app_flutter.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'load_at_client_preference.dart';

Future<void> onboarding(BuildContext context, String routeOnSuccess) async {
  final Future<AtClientPreference> futurePreference = loadAtClientPreference();
  if (context.mounted) {
    AtOnboardingResult onboardingResult = await AtOnboarding.onboard(
      context: context,
      config: AtOnboardingConfig(
        atClientPreference: await futurePreference,
        domain: AtEnv.rootDomain,
        rootEnvironment: RootEnvironment.Production,
        appAPIKey: AtEnv.appApiKey,
      ),
    );
    switch (onboardingResult.status) {
      case AtOnboardingResultStatus.success:
        {
          if (context.mounted) {
            context.goNamed(routeOnSuccess);
          }
        }
        break;
      case AtOnboardingResultStatus.error:
        {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'An error has occurred trying to onboard ${onboardingResult.atsign}:\n'
                    'ErrorCode: ${onboardingResult.errorCode}\n'
                    'Status: ${onboardingResult.status}\n'
                    'Error Message: ${onboardingResult.message}\n'),
              ),
            );
          }
        }
        break;
      case AtOnboardingResultStatus.cancel:
        break;
    }
  }
}
