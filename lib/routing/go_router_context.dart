// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011123356
// 11.10.2023 12:33

import 'package:flutter/widgets.dart';
import 'package:medical_device_classifier/routing/go_router_configuration.dart';

/// The [goRouterContext] getter retrieves the current [BuildContext] associated
/// with the application's router navigator, accessed through the [navigatorKey]
/// of the [goRouterConfiguration.routerDelegate]. This getter provides access to
/// the context within the routing system, which can be useful for triggering
/// navigation or performing other actions related to routing.
///
/// Returns the current [BuildContext] associated with the router navigator,
/// or `null` if it's unavailable.
BuildContext? get goRouterContext =>
    goRouterConfiguration.routerDelegate.navigatorKey.currentContext;

