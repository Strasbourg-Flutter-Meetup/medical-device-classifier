// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024162805
// 24.10.2023 16:28
import 'package:flutter/material.dart';

/// A checkbox widget for classification preconditions.
///
/// The [ClassificationPreconditionsCheckbox] widget displays a checkbox with a title
/// and allows the user to toggle its state. It is commonly used in the classification
/// preconditions screen to capture user responses to specific questions.
///
/// Example:
///
/// ```dart
/// final checkbox = ClassificationPreconditionsCheckbox(
///   title: 'Is your product a medical device?',
///   value: isMedicalProduct,
///   onChanged: (value) {
///     // Handle checkbox state change here.
///   },
/// );
/// ```
class ClassificationPreconditionsCheckbox extends StatelessWidget {
  const ClassificationPreconditionsCheckbox({
    super.key,
    required this.title,
    required this.onChanged,
    required this.value,
  });

  /// The title text displayed next to the checkbox.
  final String title;

  /// A callback function that is invoked when the checkbox state changes.
  ///
  /// The function receives a `bool?` argument representing the new state of the checkbox.
  /// It can be used to update the checkbox's state or perform actions based on the state change.
  final void Function(bool?) onChanged;

  /// The current state of the checkbox.
  ///
  /// If `true`, the checkbox is checked; otherwise, it is unchecked.
  final bool value;

  @override
  Widget build(BuildContext context) => CheckboxListTile(
    title: Text(
      title,
    ),
    value: value,
    onChanged: onChanged,
  );
}

