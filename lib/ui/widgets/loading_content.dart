// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012111945
// 12.10.2023 11:19
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/widgets/loading_cycle.dart';

/// The [LoadingBuildContent] class is a Flutter `StatelessWidget` used to represent a screen or
/// content area that displays a loading indicator. It is typically utilized to inform users
/// that content is being loaded or processed.

class LoadingBuildContent extends StatelessWidget {
  /// Constructor for the [LoadingBuildContent] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for this widget.

  const LoadingBuildContent({
    super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    /// This method builds the widget's UI.
    ///
    /// It centers the [LoadingCycle] widget, which displays a loading animation,
    /// within the parent widget. This provides a visual indication to the user
    /// that content is currently loading or being processed.

    return const Center(child: LoadingCycle());
  }
}
