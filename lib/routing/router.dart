// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011124442
// 11.10.2023 12:44
import 'package:go_router/go_router.dart';
import 'package:medical_device_classifier/routing/go_router_context.dart';
import 'package:medical_device_classifier/routing/go_router_path.dart';


/// Navigates to the definitions page.
///
/// The [routeToDefinitions] function uses the [goRouterContext]
/// to perform navigation to the page associated with the [nameToDefinitions].
/// This function can be called to programmatically navigate to the definitions page.
void routeToDefinitions() {
  goRouterContext?.goNamed(
    nameToDefinitions,
  );
}


/// Navigates to the general explanations of rules page.
///
/// The [routeToGeneralExplanationOfRules] function uses the [goRouterContext]
/// to perform navigation to the page associated with the [nameToGeneralExplanationOfRules].
/// This function can be called to programmatically navigate to the general
/// explanations of rules page.
void routeToGeneralExplanationOfRules() {
  goRouterContext?.goNamed(
    nameToGeneralExplanationOfRules,
  );
}

/// Navigates to the implementing rules page.
///
/// The [routeToImplementingRules] function uses the [goRouterContext]
/// to perform navigation to the page associated with the [nameToImplementingRules].
/// This function can be called to programmatically navigate to the implementing
/// rules page.
void routeToImplementingRules() {
  goRouterContext?.goNamed(
    nameToImplementingRules,
  );
}
