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
/// The [BuildContextExtension] extension adds a `appLocalizations` property
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
extension BuildContextExtension on BuildContext {
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

  /// Determines the screen size class based on the screen width.
  ///
  /// The [getScreenSizeClass] method calculates the screen size class based on
  /// the width of the screen as obtained from the [MediaQuery] of the current
  /// context. It categorizes screens into three broad classes: small, medium,
  /// and large, and returns the appropriate [ScreenSizeClass] enum value.
  ///
  /// - For screens with a width greater than or equal to 1008.0 pixels,
  ///   it returns [ScreenSizeClass.largeScreen].
  ///
  /// - For screens with a width between 641.0 pixels (inclusive) and 1008.0 pixels
  ///   (exclusive), it returns [ScreenSizeClass.mediumScreen].
  ///
  /// - For screens with a width less than 641.0 pixels, it returns
  ///   [ScreenSizeClass.smallScreen].
  ///
  /// Returns:
  /// - [ScreenSizeClass.largeScreen] for screens with a width >= 1008.0 pixels.
  /// - [ScreenSizeClass.mediumScreen] for screens with a width between
  ///   641.0 pixels (inclusive) and 1008.0 pixels (exclusive).
  /// - [ScreenSizeClass.smallScreen] for screens with a width < 641.0 pixels.
  ScreenSizeClass getScreenSizeClass() {
    final width = MediaQuery.of(this).size.width;

    if (width >= 1008.0) {
      return ScreenSizeClass.largeScreen;
    } else if (width >= 641.0 && width < 1008.0) {
      return ScreenSizeClass.mediumScreen;
    } else {
      return ScreenSizeClass.smallScreen;
    }
  }

}

/// Enumeration representing different screen size classes.
///
/// The [ScreenSizeClass] enum categorizes screens into three broad classes
/// based on their width: small, medium, and large. These classes can be used
/// to adapt the user interface and layout for different screen sizes.
enum ScreenSizeClass {
  /// Represents a small screen size.
  smallScreen,

  /// Represents a medium screen size.
  mediumScreen,

  /// Represents a large screen size.
  largeScreen,
}

