// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024145817
// 24.10.2023 14:58
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension on [BuildContext] to provide convenient access to [AppLocalizations].
///
/// The [AppLocalizationBuildContext] extension adds a `appLocalizations` property
/// to [BuildContext], allowing easy access to the [AppLocalizations] object
/// using the `of` method.
///
/// This extension is useful for obtaining localized strings and resources within
/// the Flutter application.
///
/// Example:
///
/// ```dart
/// final localizedString = context.appLocalizations?.someLocalizedString;
/// ```
extension AppLocalizationBuildContext on BuildContext {
  /// Provides access to [AppLocalizations] for localization within the app.
  ///
  /// Use this property to retrieve an instance of [AppLocalizations] associated
  /// with the current [BuildContext], allowing access to localized strings and
  /// resources.
  ///
  /// Returns:
  /// An instance of [AppLocalizations] or `null` if not available.
  ///
  /// Example:
  ///
  /// ```dart
  /// final localizedString = context.appLocalizations?.someLocalizedString;
  /// ```
  AppLocalizations? get appLocalizations => AppLocalizations.of(this);
}
