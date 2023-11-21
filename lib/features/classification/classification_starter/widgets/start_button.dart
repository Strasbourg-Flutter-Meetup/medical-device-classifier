// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231023134705
// 23.10.2023 13:47
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/build_context_extension.dart';
import 'package:medical_device_classifier/routing/router.dart';

/// A widget representing the start button for the classification starter screen.
///
/// The [StartButton] widget displays a button that allows the user to initiate
/// the classification task or start a specific action on the screen.
///
/// Example usage:
///
/// ```dart
/// StartButton(),
/// ```
class StartButton extends StatelessWidget {
  /// Creates a [StartButton] widget.
  ///
  /// The `key` parameter can be used to provide a key that uniquely identifies
  /// this widget.
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: routeToClassificationPreconditions,
      child: Text(
        context.appLocalizations?.classificationStarterStartButtonText ?? '',
      ),
    );
  }
}
