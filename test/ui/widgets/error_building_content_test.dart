// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012121849
// 12.10.2023 12:18
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/ui/widgets/error_building_content.dart';
/// These widget tests cover two scenarios:
///
/// The first test verifies that the ErrorBuildingContent widget displays the
/// default error message when no custom error message is provided.
///
/// The second test verifies that the ErrorBuildingContent widget displays
/// a custom error message when one is provided.
///
/// Make sure you have the ErrorMessage widget properly defined and imported in
/// your project for these tests to work correctly.

void main() {
  testWidgets('ErrorBuildingContent displays default error message', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ErrorBuildingContent(),
        ),
      ),
    );

    // Verify that the default error message is displayed.
    expect(find.text('Something went wrong. Please try again later.'), findsOneWidget);
  });

  testWidgets('ErrorBuildingContent displays custom error message', (WidgetTester tester) async {
    // Custom error message to be displayed.
    const customErrorMessage = 'Custom error message';

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ErrorBuildingContent(errorMessage: customErrorMessage),
        ),
      ),
    );

    // Verify that the custom error message is displayed.
    expect(find.text(customErrorMessage), findsOneWidget);
  });
}
