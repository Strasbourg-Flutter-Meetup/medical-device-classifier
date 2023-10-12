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
import 'package:medical_device_classifier/features/dashboard/presentation/screen/dashboard.dart';
import 'package:medical_device_classifier/features/definitions/presentation/screen/definitions.dart';
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
