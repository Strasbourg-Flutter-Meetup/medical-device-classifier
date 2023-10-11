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

void routeToDefinitions() {
  goRouterContext?.goNamed(
    pathToDefinitions,
  );
}
