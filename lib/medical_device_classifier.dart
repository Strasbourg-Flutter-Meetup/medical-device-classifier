// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231006105422
// 06.10.2023 10:54

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medical_device_classifier/routing/go_router_configuration.dart';

class MedicalDeviceClassifier extends StatelessWidget {
  const MedicalDeviceClassifier({super.key});

  @override
  Widget build(BuildContext context) => AdaptiveTheme(
        light: ThemeData.light(useMaterial3: true),
        dark: ThemeData.dark(useMaterial3: true),
        initial: AdaptiveThemeMode.system,
        builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
          title: 'Medical Device Classifier',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: goRouterConfiguration,
          theme: light,
          darkTheme: dark,
        ),
      );
}
