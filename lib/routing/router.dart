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

/// Navigates to the classification screen.
///
/// Calls the GoRouter to navigate to the classification screen using the
/// predefined route name [nameToClassification].
void routeToClassification() {
  goRouterContext?.goNamed(
    nameToClassification,
  );
}

/// Navigates back to the previous screen.
///
/// Calls the GoRouter to navigate back to the previous screen.
void goBack() {
  goRouterContext?.pop();
}

/// Navigates to the home (dashboard) screen.
///
/// Calls the GoRouter to navigate to the home (dashboard) screen using the
/// predefined route path [pathToDashboard].
void goToHome() {
  goRouterContext?.go(pathToDashboard);
}

/// Navigates to the About Us screen.
///
/// The [routeToAboutUs] function is used to navigate to the About Us screen within the app.
/// It utilizes the GoRouter context to trigger the navigation by invoking the named route
/// associated with the About Us screen.
void routeToAboutUs() {
  goRouterContext?.goNamed(nameToAboutUs);
}
/// Navigates to the legal notice screen.
///
/// If [goRouterContext] is available, it uses it to navigate to the legal notice screen
/// by using the [nameToLegalNotice] route name.
void routeToLegalNotice() {
  goRouterContext?.goNamed(nameToLegalNotice);
}

/// Navigates to the privacy policy screen.
///
/// If [goRouterContext] is available, it uses it to navigate to the privacy policy screen
/// by using the [nameToPrivacyPolicy] route name.
void routeToPrivacyPolicy() {
  goRouterContext?.goNamed(nameToPrivacyPolicy);
}


