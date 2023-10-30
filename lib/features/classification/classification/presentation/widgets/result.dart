// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231029140427
// 29.10.2023 14:04
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A widget for displaying the classification result.
class Result extends StatelessWidget {
  /// Constructs a [Result] widget.
  ///
  /// - [rule]: The rule associated with the classification result.
  /// - [classification]: The classification obtained from the result.
  const Result({
    super.key,
    required this.rule,
    required this.classification,
  });

  /// The rule associated with the classification result.
  final String rule;

  /// The classification obtained from the result.
  final String classification;

  @override
  Widget build(BuildContext context) => Text(
        // Retrieves the classification text from the app's localizations.
        AppLocalizations.of(context)
                ?.classificationText(rule, classification) ??
            'Classification was not possible',
      );
}
