// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231023134839
// 23.10.2023 13:48
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A widget representing the build content section of the classification starter screen.
///
/// The [ClassificationStarterBuildContent] widget displays the textual content
/// for the classification starter screen. It typically includes introductory
/// information or instructions for the classification task.
///
/// Example usage:
///
/// ```dart
/// ClassificationStarterBuildContent(),
/// ```
class ClassificationStarterBuildContent extends StatelessWidget {
  /// Creates a [ClassificationStarterBuildContent] widget.
  ///
  /// The `key` parameter can be used to provide a key that uniquely identifies
  /// this widget.
  const ClassificationStarterBuildContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600.0,),
      child: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)?.classificationStarter1 ?? '',
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  AppLocalizations.of(context)?.classificationStarter2 ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
