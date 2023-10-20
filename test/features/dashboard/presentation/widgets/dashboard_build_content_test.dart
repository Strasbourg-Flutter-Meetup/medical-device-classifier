// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012145627
// 12.10.2023 14:56
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/widgets/dashboard_build_content.dart';

void main() {
  testWidgets('DashboardBuildContent widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashboardBuildContent(),
        ),
      ),
    );

    // Verify that the "Here will be the dashboard..." text is displayed.
    expect(
      find.text(
        'Here will be the dashboard of the Medical Device Classifier application',
      ),
      findsOneWidget,
    );

    // Verify that the "Definitions" button is displayed.
    expect(find.text('Definitions'), findsOneWidget);

    // Tap the "Definitions" button.
    await tester.tap(find.text('Definitions'));
    await tester.pump();

    // You can add additional verification steps if needed.
  });
}
