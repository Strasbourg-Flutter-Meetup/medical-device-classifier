// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012110700
// 12.10.2023 11:07
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/widgets/error_message.dart';

/// The [ErrorBuildingContent] class is a Flutter `StatelessWidget` that represents a screen
/// displaying an error message. It is typically used to notify users when an error occurs
/// during the process of building content or rendering a screen.

class ErrorBuildingContent extends StatelessWidget {
  /// The error message to be displayed on the screen.
  final String errorMessage;

  /// Constructor for the [ErrorBuildingContent] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for this widget.
  /// [errorMessage] is an optional parameter that specifies the error message to be displayed.
  /// If not provided, a default error message is used.

  const ErrorBuildingContent({
    super.key,
    this.errorMessage = 'Something went wrong. Please try again later.',
  });

  @override
  Widget build(BuildContext context) {
    /// This method builds the widget's UI.
    ///
    /// It centers the [ErrorMessage] widget containing the error message text
    /// within the parent widget.
    ///
    /// [errorMessage] is displayed to inform the user about the error.

    return Center(
      child: ErrorMessage(errorMessage: errorMessage),
    );
  }
}
