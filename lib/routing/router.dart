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

/// Navigates to the classification starter screen using the GoRouter.
///
/// The [routeToClassificationStarter] function utilizes the GoRouter to
/// navigate to the classification starter screen by specifying the name of the
/// route associated with that screen. It is typically called when an action
/// or event triggers the navigation to the classification starter screen.
void routeToClassificationStarter() {
  goRouterContext?.goNamed(
    nameToClassificationStarter,
  );
}

/// Navigates to the classification preconditions screen.
///
/// The `routeToClassificationPreconditions` function is used to initiate
/// navigation to the classification preconditions screen. It utilizes the
/// [GoRouterContext] to perform the navigation based on the predefined name
/// for the classification preconditions route.
void routeToClassificationPreconditions() {
  goRouterContext?.goNamed(
    nameToClassificationPreconditions,
  );
}

