// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012112227
// 12.10.2023 11:22
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/routing/router.dart';

/// The [DashboardBuildContent] class is a Flutter `StatelessWidget` used to represent a screen or
/// content area that displays dashboard-related content for the Medical Device Classifier application.

class DashboardBuildContent extends StatelessWidget {
  /// Constructor for the [DashboardBuildContent] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for this widget.

  const DashboardBuildContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// This method builds the widget's UI.
    ///
    /// It creates a column of widgets, including:
    /// 1. A text widget displaying a message about the application's dashboard.
    /// 2. A sized box with a height of 96.0 for spacing.
    /// 3. An elevated button with the label "Definitions" that triggers the `routeToDefinitions` action when pressed.

    return const Column(
      children: [
        Text(
          'Here will be the dashboard of the Medical Device Classifier application',
        ),
        SizedBox(
          height: 96.0,
        ),
        ElevatedButton(
          onPressed: routeToDefinitions,
          child: Text(
            'Definitions',
          ),
        ),
        SizedBox(
          height: 96.0,
        ),
        ElevatedButton(
          onPressed: routeToImplementingRules,
          child: Text(
            'Annex VIII Chapter 2: Implementing Rule',
          ),
        ),
        SizedBox(
          height: 96.0,
        ),
        ElevatedButton(
          onPressed: routeToGeneralExplanationOfRules,
          child: Text(
            'General explanation of rules',
          ),
        ),
      ],
    );
  }
}
