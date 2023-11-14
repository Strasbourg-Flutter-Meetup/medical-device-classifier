// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011123336
// 11.10.2023 12:33
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_device_classifier/features/about_us/about_us.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/screens/classification.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/screen/classification_preconditions.dart';
import 'package:medical_device_classifier/features/classification/classification_starter/screen/classification_starter.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/screen/dashboard.dart';
import 'package:medical_device_classifier/features/definitions/presentation/screen/definitions.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/screen/general_explanation_of_rules.dart';
import 'package:medical_device_classifier/features/implementing_rules/presentation/screen/implementing_rules.dart';
import 'package:medical_device_classifier/features/legal_notice/screen/legal_notice.dart';
import 'package:medical_device_classifier/features/privacy_policy/screen/privacy_policy.dart';
import 'package:medical_device_classifier/routing/go_router_path.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';
import 'package:medical_device_classifier/ui/widgets/error_building_content.dart';

/// The configuration for the application's routing system.
///
/// The [goRouterConfiguration] specifies the initial location, error handling,
/// and available routes for the application's routing system using the
/// [GoRouter] package.
final goRouterConfiguration = GoRouter(
  initialLocation: pathToDashboard,
  errorBuilder: (context, goRouterState) {
    return const ScreenTemplate(
      appBarTemplate: AppBarTemplate(),
      child: ErrorBuildingContent(),
    );
  },
  routes: [
    _toDashboard,
  ],
);

/// The [_toDashboard] route configuration represents the path and page
/// transition for navigating to the dashboard screen. It uses a custom page
/// transition animation, a `FadeTransition`, to transition to the [Dashboard]
/// widget when navigating to this route. Additionally, it defines sub-routes,
/// such as [_toDefinitions], that can be accessed from the dashboard.
final _toDashboard = GoRoute(
  path: pathToDashboard,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const Dashboard(),
  ),
  routes: [
    _toDefinitions,
    _toGeneralExplanationsOfRules,
    _toImplementingRules,
    _toClassificationStarter,
    _toAboutUs,
    _toLegalNotice,
    _toPrivacyPolicy,
  ],
);

/// The [_toDefinitions] route configuration represents the path and page
/// transition for navigating to the definitions screen. Similar to [_toDashboard],
/// it uses a custom `FadeTransition` animation to transition to the [Definitions]
/// widget when navigating to this route.
final _toDefinitions = GoRoute(
  path: pathToDefinitions,
  name: nameToDefinitions,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const Definitions(),
  ),
);

/// A [GoRoute] representing navigation to the general explanations of rules page.
///
/// The [_toGeneralExplanationsOfRules] variable defines a [GoRoute] that can be
/// used to navigate to the page that displays general explanations of rules.
/// It specifies the path, name, and the page builder function for creating
/// the page with a custom transition.
final _toGeneralExplanationsOfRules = GoRoute(
  path: pathToGeneralExplanationOfRules,
  name: nameToGeneralExplanationOfRules,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const GeneralExplanationOfRules(),
  ),
);

/// A [GoRoute] representing navigation to the implementing rules page.
///
/// The [_toImplementingRules] variable defines a [GoRoute] that can be
/// used to navigate to the page that displays implementing rules.
/// It specifies the path, name, and the page builder function for creating
/// the page with a custom transition.
final _toImplementingRules = GoRoute(
  path: pathToImplementingRules,
  name: nameToImplementingRules,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const ImplementingRules(),
  ),
);

/// A route for navigating to the classification starter screen.
///
/// The [_toClassificationStarter] route represents a navigation route that
/// leads to the classification starter screen. It specifies the route's path,
/// name, and the page builder function responsible for creating the screen
/// with transition animations.
final _toClassificationStarter = GoRoute(
  path: pathToClassificationStarter,
  name: nameToClassificationStarter,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const ClassificationStarter(),
  ),
  routes: [
    _toClassificationPrecondition,
  ],
);

/// A [GoRoute] used for navigating to the classification preconditions screen.
///
/// The [_toClassificationPrecondition] route represents the navigation route
/// to the classification preconditions screen. It includes the path, name, and
/// page builder to define how the screen is presented.
final _toClassificationPrecondition = GoRoute(
  path: pathToClassificationPreconditions,
  name: nameToClassificationPreconditions,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const ClassificationPrecondition(),
  ),
  routes: [
    _toClassification,
  ],
);

/// A [GoRoute] used for navigating to the classification screen.
///
/// The [_toClassification] route represents the navigation route to the
/// classification screen. It includes the path, name, and page builder to
/// define how the screen is presented with a fade transition animation.
final _toClassification = GoRoute(
  path: pathToClassification,
  name: nameToClassification,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const Classification(),
  ),
);

/// A [GoRoute] used for navigating to the 'About Us' page.
///
/// The [_toAboutUs] route configuration is used to navigate to the 'About Us'
/// page in the application. It defines the path, name, and page builder for
/// presenting the page with a fade transition animation.
final _toAboutUs = GoRoute(
  path: pathToAboutUs,
  name: nameToAboutUs,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
    child: const AboutUs(),
  ),
);
/// A route configuration for navigating to the legal notice screen.
///
/// This route is defined with a specific path, name, and a custom transition page builder.
final _toLegalNotice = GoRoute(
  path: pathToLegalNotice,
  name: nameToLegalNotice,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    child: const LegalNotice(),
  ),
);

/// A route configuration for navigating to the privacy policy screen.
///
/// This route is defined with a specific path, name, and a custom transition page builder.
final _toPrivacyPolicy = GoRoute(
  path: pathToPrivacyPolicy,
  name: nameToPrivacyPolicy,
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    child: const PrivacyPolicy(),
  ),
);

