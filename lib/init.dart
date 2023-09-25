import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src.dart';

class Init extends ConsumerWidget {
  const Init({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: goRouter,
        // *** LOCALES ***
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
