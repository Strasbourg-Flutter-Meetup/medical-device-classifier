// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231006105422
// 06.10.2023 10:54

import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/language_handler/presentation/cubits/language_cubit.dart';
import 'package:medical_device_classifier/routing/go_router_configuration.dart';

/// The `MedicalDeviceClassifier` widget is the root widget of the Medical Device Classifier application.
///
/// It serves as the entry point and wraps the main content in a [BlocProvider] for the [LanguageCubit].
class MedicalDeviceClassifier extends StatelessWidget {
  /// Creates a [MedicalDeviceClassifier] widget.
  ///
  /// This widget is the root of the Medical Device Classifier application. It provides a [BlocProvider]
  /// for the [LanguageCubit] to handle language-related state and updates.
  const MedicalDeviceClassifier({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<LanguageCubit>(
        create: (context) =>
            getIt.get<LanguageCubit>()..listenToGlobalEventBus(),
        child: _MedicalDeviceClassifierContent(),
      );
}

/// The `_MedicalDeviceClassifierContent` widget represents the main content of the Medical Device Classifier application.
///
/// It includes theming using [AdaptiveTheme], localization support, and routing using [MaterialApp.router].
class _MedicalDeviceClassifierContent extends StatefulWidget {
  @override
  State<_MedicalDeviceClassifierContent> createState() =>
      _MedicalDeviceClassifierContentState();
}

class _MedicalDeviceClassifierContentState
    extends State<_MedicalDeviceClassifierContent> {
  LanguageCubit? _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<LanguageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    // Obtain the language data from the [LanguageCubit] using the [context.watch] method.
    final data = context.watch<LanguageCubit>().state.data;

    final colorSchemeLight = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.lightBlueAccent,
    );
    final colorSchemeDark = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.lightBlueAccent,
    );

    return AdaptiveTheme(
      light: ThemeData(
        colorScheme: colorSchemeLight,
        useMaterial3: true,
      ),
      dark: ThemeData(
        colorScheme: colorSchemeDark,
        useMaterial3: true,
      ),
      initial: AdaptiveThemeMode.system,
      // Initial theme mode (light, dark, or system).
      builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
        locale: data == null ? null : Locale(data.languageCode),
        // Set the locale based on language data.
        title: 'Medical Device Classifier',
        // Application title.
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        // Localization delegates.
        supportedLocales: AppLocalizations.supportedLocales,
        // Supported locales.
        routerConfig: goRouterConfiguration,
        // Router configuration for navigation.
        theme: light,
        // Light theme.
        darkTheme: dark, // Dark theme.
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    unawaited(
      _cubit?.cancelGlobalEventBusSubscription(),
    );
  }
}
