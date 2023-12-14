// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012112227
// 12.10.2023 11:22
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/extensions/build_context_extension.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/widgets/dashboard_sticky_note.dart';
import 'package:medical_device_classifier/features/legal_notice/widgets/legal_notice_content.dart';
import 'package:medical_device_classifier/features/privacy_policy/widgets/privacy_policy_content.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';
import 'package:medical_device_classifier/routing/router.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';
import 'package:medical_device_classifier/ui/content_builder.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/listtile_button.dart';

/// A content builder for the dashboard screen.
///
/// The [DashboardBuildContentBuilder] class is responsible for building the
/// content for the dashboard screen based on the provided [DashboardStateData].
/// It overrides the [build] method to create a [DashboardBuildContent] widget
/// with the given data.
class DashboardBuildContentBuilder extends ContentBuilder<DashboardStateData> {
  /// Builds the dashboard content based on the provided [data].
  ///
  /// The [data] parameter contains the necessary data for constructing the
  /// dashboard content. This method returns a [DashboardBuildContent] widget
  /// configured with the provided data.
  @override
  Widget build({required data}) => DashboardBuildContent(
        data: data,
      );
}

class DashboardBuildContent extends StatelessWidget {
  /// Constructor for the [DashboardBuildContent] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for this widget.
  const DashboardBuildContent({
    super.key,
    required this.data,
  });

  final DashboardStateData data;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (data.showDisclaimerDialog) {
        _showDialog(context);
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 12.0,
        ),
        Stack(
          children: [
            Container(
              height: 250.0,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/header_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 48.0,
              bottom: 48.0,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: UIConstants.dashboardHeaderImageTextMaxWidth,
                ),
                child: const Text(
                  'Classify your medical device',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: UIConstants.maxWidth,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 24.0,
                  ),
                  child: Text(
                    context.appLocalizations?.dashboardExplanationText ?? '',
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: UIConstants.maxWidth,
          ),
          child: const DashboardStickyNote(),
        ),
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
                  context.appLocalizations?.dashboardDefinitionsSubtitle ?? '',
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
                  context.appLocalizations?.dashboardGeneralExplanationTitle ??
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

  /// Method to display the legal notice disclaimer dialog.
  ///
  /// This method shows an AlertDialog with the legal notice content and a button for acknowledging the disclaimer.
  /// The [context] parameter is used to access the current app's localization and navigation context.
  ///
  /// Business logic for setting the legal notice confirmation flag in SharedPreferences is performed here directly
  /// for simplicity, even though it's a departure from the typical practice of using a Cubit for state management.
  /// The effort for creating a dedicated Cubit for a single setString call is considered overhead in this case.
  ///
  /// When the user acknowledges the disclaimer by pressing the button, the legal notice confirmation flag is set to 'true'
  /// in SharedPreferences, and the dialog is closed.
  void _showDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: UIConstants.maxWidthHalf,
          ),
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.1,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    context.appLocalizations
                            ?.dialogPrivacyPolicyLegalNoticeTitle ??
                        '',
                  ),
                ),
              ],
            ),
            content: Column(
              children: [
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            PrivacyPolicyContent(),
                            SizedBox(
                              height: 24.0,
                            ),
                            LegalNoticeContent(
                              showHeadline: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextButton(
                  onPressed: () async {
                    // Set the legal notice confirmation flag to 'true' in SharedPreferences.
                    await getIt.get<SharedPreferencesRepository>().setString(
                          key: SharedPreferencesKeys.legalNoticeConfirmation,
                          value: 'true',
                        );

                    getIt.get<GlobalEventBus>().addEvent(
                          GlobalEvent.disableShowDisclaimerDialog,
                        );

                    // Close the dialog.
                    goBack();
                  },
                  child: Text(
                    context.appLocalizations?.disclaimerDialogButton ?? '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
