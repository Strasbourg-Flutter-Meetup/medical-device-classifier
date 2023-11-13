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
import 'package:medical_device_classifier/features/dashboard/presentation/widgets/dashboard_sticky_note.dart';
import 'package:medical_device_classifier/routing/router.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/listtile_button.dart';

class DashboardBuildContent extends StatelessWidget {
  /// Constructor for the [DashboardBuildContent] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for this widget.
  const DashboardBuildContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250.0,
            width: UIConstants.maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/header_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 24.0,
            ),
            child: Text(
              context.appLocalizations?.dashboardExplanationText ?? '',
            ),
          ),
          const DashboardStickyNote(),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTileButton(
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
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTileButton(
                  title: Text(
                    context.appLocalizations?.dashboardDefinitionsTitle ?? '',
                  ),
                  onTap: routeToDefinitions,
                  leading: const Icon(Icons.list_alt_outlined),
                  subtitle: Text(
                    context.appLocalizations?.dashboardDefinitionsSubtitle ??
                        '',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTileButton(
                  title: Text(
                    context.appLocalizations?.dashboardImplementingRulesTitle ??
                        '',
                  ),
                  onTap: routeToImplementingRules,
                  leading: const Icon(Icons.rule_outlined),
                  subtitle: Text(
                    context.appLocalizations
                            ?.dashboardImplementingRulesSubtitle ??
                        '',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTileButton(
                  title: Text(
                    context.appLocalizations
                            ?.dashboardGeneralExplanationTitle ??
                        '',
                  ),
                  onTap: routeToGeneralExplanationOfRules,
                  leading: const Icon(Icons.description_outlined),
                  subtitle: Text(
                    context.appLocalizations
                            ?.dashboardGeneralExplanationSubtitle ??
                        '',
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
