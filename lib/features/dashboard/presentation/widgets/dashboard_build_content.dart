// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012112227
// 12.10.2023 11:22
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/routing/router.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/listtile_button.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: UIConstants.maxWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              context.appLocalizations?.dashboardExplanationText ?? '',
            ),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        ListTileButton(
          leading: const Icon(
            Icons.account_tree_outlined,
          ),
          title: Text(
            context.appLocalizations?.dashboardClassifierTitle ?? '',
          ),
          onTap: routeToClassificationStarter,
          subtitle: Text(
            context.appLocalizations?.dashboardClassifierSubtitle ?? '',
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
        ListTileButton(
          title: Text(
            context.appLocalizations?.dashboardDefinitionsTitle ?? '',
          ),
          onTap: routeToDefinitions,
          leading: const Icon(Icons.list_alt_outlined),
          subtitle: Text(
            context.appLocalizations?.dashboardDefinitionsSubtitle ?? '',
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
        ListTileButton(
          title: Text(
            context.appLocalizations?.dashboardImplementingRulesTitle ?? '',
          ),
          onTap: routeToImplementingRules,
          leading: const Icon(Icons.rule_outlined),
          subtitle: Text(
            context.appLocalizations?.dashboardImplementingRulesSubtitle ?? '',
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
        ListTileButton(
          title: Text(
            context.appLocalizations?.dashboardGeneralExplanationTitle ?? '',
          ),
          onTap: routeToGeneralExplanationOfRules,
          leading: const Icon(Icons.description_outlined),
          subtitle: Text(
            context.appLocalizations?.dashboardGeneralExplanationSubtitle ?? '',
          ),
        ),
      ],
    );
  }
}
