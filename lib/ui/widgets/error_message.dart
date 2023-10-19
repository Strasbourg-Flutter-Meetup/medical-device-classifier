// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011205927
// 11.10.2023 20:59
import 'package:flutter/material.dart';

/// The [ErrorMessage] widget is a Flutter `StatelessWidget` used to display
/// error messages with an error icon (a red exclamation mark) and a text message.
class ErrorMessage extends StatelessWidget {
  /// Constructor for the [ErrorMessage] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for
  /// this widget.
  ///
  /// [errorMessage] is a required parameter that specifies the error message
  /// to be displayed within the widget.
  const ErrorMessage({
    super.key,
    required this.errorMessage,
  });

  /// The error message to be displayed within the widget.
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    // This widget displays an error message with an error icon (red exclamation mark)
    // and a text message.
    return ListTile(
      // The leading widget, which is an icon indicating an error (red exclamation mark).
      leading: const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
      // The title text, which displays the error message.
      title: Text(errorMessage),
    );
  }
}
