// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011123336
// 11.10.2023 12:33
import 'package:go_router/go_router.dart';
import 'package:medical_device_classifier/feature/dashboard/presentation/screen/dashboard.dart';
import 'package:medical_device_classifier/feature/definitions/presentation/screen/defintions.dart';
import 'package:medical_device_classifier/routing/go_router_path.dart';

final goRouterConfiguration = GoRouter(
  initialLocation: pathToDashboard,
  routes: [
    _toDashboard,
  ],
);

final _toDashboard = GoRoute(
  path: pathToDashboard,
  builder: (context, state) => const Dashboard(),
  routes: [
    _toDefinitions,
  ],
);

final _toDefinitions = GoRoute(
  path: pathToDefinitions,
  name: nameToDefinitions,
  builder: (context, state) => const Definitions(),
);
