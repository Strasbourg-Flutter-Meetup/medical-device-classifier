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
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/screen/classification_preconditions.dart';
import 'package:medical_device_classifier/features/classification/classification_starter/screen/classification_starter.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/screen/dashboard.dart';
import 'package:medical_device_classifier/features/definitions/presentation/screen/definitions.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/screen/general_explanation_of_rules.dart';
import 'package:medical_device_classifier/features/implementing_rules/screen/implementing_rules.dart';
import 'package:medical_device_classifier/routing/go_router_path.dart';

/// The [goRouterConfiguration] instance is used to configure and manage the
/// application's routing system through the GoRouter package. It specifies the
/// initial route location and defines the available routes for navigation.
final goRouterConfiguration = GoRouter(
  initialLocation: pathToDashboard,
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
);
