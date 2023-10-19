// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012121154
// 12.10.2023 12:11
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/ui/widgets/error_message.dart';

/// In the below code, we have two test cases:
///
/// ErrorMessage widget displays error message and icon: This test case checks
/// if the ErrorMessage widget displays both the error icon and the error
/// message correctly.
///
/// ErrorMessage widget displays correct error message: This test case checks
/// if the widget displays the correct error message when given a different
/// error message as a prop.

void main() {
  testWidgets('ErrorMessage widget displays error message and icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        // Wrap with MaterialApp
        home: Scaffold(
          // Scaffold provides a Material ancestor
          body: ErrorMessage(
            errorMessage: 'Sample Error Message',
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.error_outline), findsOneWidget);
    expect(find.text('Sample Error Message'), findsOneWidget);
  });

  testWidgets('ErrorMessage widget displays correct error message',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        // Wrap with MaterialApp
        home: Scaffold(
          // Scaffold provides a Material ancestor
          body: ErrorMessage(
            errorMessage: 'Another Error Message',
          ),
        ),
      ),
    );

    expect(find.text('Another Error Message'), findsOneWidget);
  });
}
