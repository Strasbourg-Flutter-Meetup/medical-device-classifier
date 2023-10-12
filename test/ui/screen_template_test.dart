// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012123410
// 12.10.2023 12:34

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/web_footer.dart';

/// These tests cover three scenarios:
///
/// It checks if the AppBarTemplate and the main content (child) are displayed
/// within the ScreenTemplate.
/// It verifies that the WebFooter is displayed when kIsWeb is true (web view).
/// It verifies that the WebFooter is not displayed when kIsWeb is false
/// (mobile view).
void main() {
  testWidgets('ScreenTemplate displays appBarTemplate and child',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: ScreenTemplate(
          appBarTemplate: AppBarTemplate(),
          child: Text('Main Content'),
        ),
      ),
    );

    // Verify that the AppBarTemplate is displayed.
    expect(find.byType(AppBarTemplate), findsOneWidget);

    // Verify that the main content is displayed.
    expect(find.text('Main Content'), findsOneWidget);
  });

  testWidgets('ScreenTemplate displays web footer on web',
      (WidgetTester tester) async {
    // Build our widget with kIsWeb as true (web view) and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: ScreenTemplate(
          appBarTemplate: AppBarTemplate(),
          child: Text('Main Content'),
        ),
      ),
    );

    // Verify that the WebFooter is displayed on web.
    if (kIsWeb) {
      expect(find.byType(WebFooter), findsOneWidget);
    } else {
      expect(find.byType(WebFooter), findsNothing);
    }
  });

  testWidgets('ScreenTemplate does not display web footer on mobile',
      (WidgetTester tester) async {
    // Build our widget with kIsWeb as false (mobile view) and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: ScreenTemplate(
          appBarTemplate: AppBarTemplate(),
          child: Text('Main Content'),
        ),
      ),
    );

    // Verify that the WebFooter is not displayed on mobile.
    if (!kIsWeb) {
      expect(find.byType(WebFooter), findsNothing);
    }
  });
}
