// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012122633
// 12.10.2023 12:26
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medical_device_classifier/ui/widgets/loading_cycle.dart';

/// This widget test checks that the LoadingCycle widget correctly displays the
/// CircularProgressIndicator, which is used as a circular loading indicator.
/// It verifies that the loading indicator is properly rendered within
/// the widget.

void main() {
  testWidgets('LoadingCycle displays CircularProgressIndicator',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingCycle(),
        ),
      ),
    );

    // Verify that the LoadingIndicator is displayed.
    expect(find.byType(LoadingIndicator), findsOneWidget);
  });
}
