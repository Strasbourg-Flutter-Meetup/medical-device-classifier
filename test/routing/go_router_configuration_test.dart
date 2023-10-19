// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012150027
// 12.10.2023 15:00
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_cubits.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/screen/dashboard.dart';
import 'package:medical_device_classifier/features/definitions/presentation/screen/definitions.dart';
import 'package:medical_device_classifier/routing/go_router_configuration.dart';

void _configureGetIt() {
  configureGetItInjections(
    injectionConfigurations: [
      InjectionCubits(),
    ],
  );
}

void main() {
  setUp(() {
    _configureGetIt();
  });

  testWidgets('Route configuration test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: goRouterConfiguration,
      ),
    );

    // Verify that the initial route location is the dashboard.
    expect(find.byType(Dashboard), findsOneWidget);

    // Simulate navigation to the definitions screen.
    await tester.tap(find.byType(ElevatedButton));

    // Trigger a frame to process the navigation.
    await tester.pumpAndSettle();

    // Verify that the definitions screen is displayed.
    expect(find.byType(Definitions), findsOneWidget);

    // You can add more test cases to simulate different routes and verify their behavior.
  });
}
