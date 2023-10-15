// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012112227
// 12.10.2023 11:22
import 'package:flutter/cupertino.dart';
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
        Center(
          child: Text(
            'The purpose of the MDR Annex VIII Classifier is to assist you in the classification of your medical device',
          ),
        ),
        SizedBox(
          height: 96.0,
        ),
        SizedBox(
          width: 600,
          child: ElevatedButton(
            onPressed: routeToClassifier,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Icon(Icons.account_tree),
                ),
                Column(
                  children: [
                    Text(
                      'Classifier',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'The Classifier helps you to classify your medical device.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 96.0,
        ),
        SizedBox(
          width: 600,
          child: ElevatedButton(
            onPressed: routeToDefinitions,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Icon(CupertinoIcons.book_solid),
                ),
                Column(
                  children: [
                    Text(
                      'Definitions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Definitions specific to the classification rules"),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 96.0,
        ),
        SizedBox(
          width: 600,
          child: ElevatedButton(
            onPressed: routeToImplementingRules,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Icon(Icons.gavel),
                ),
                Column(
                  children: [
                    Text(
                      'Implementing rules',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rules which have to be taken into account during classification",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
