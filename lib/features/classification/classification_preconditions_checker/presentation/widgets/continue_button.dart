// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024161953
// 24.10.2023 16:19
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/routing/router.dart';

/// A button widget used to continue to the next step in a process.
///
/// The [ContinueButton] widget is typically used to allow the user to proceed
/// to the next step or screen when certain conditions are met. It appears as
/// an elevated button and can be enabled or disabled based on the [isActive] property.
///
/// Example:
///
/// ```dart
/// final continueButton = ContinueButton(
///   isActive: isContinueButtonActive,
/// );
/// ```
class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.isActive,
  });

  /// A flag indicating whether the button is active and can be pressed.
  ///
  /// If `true`, the button is enabled and can be pressed by the user.
  /// If `false`, the button is disabled and cannot be pressed.
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? routeToClassification : null,
      child: Text(
        context.appLocalizations?.classificationPreconditionsContinueButton ??
            '',
      ),
    );
  }
}
