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

BuildContext? get goRouterContext =>
    goRouterConfiguration.routerDelegate.navigatorKey.currentContext;
