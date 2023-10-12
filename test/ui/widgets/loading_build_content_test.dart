// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012122507
// 12.10.2023 12:25
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/ui/widgets/loading_content.dart';
import 'package:medical_device_classifier/ui/widgets/loading_cycle.dart';

/// This widget test checks that the LoadingBuildContent widget correctly
/// displays the LoadingCycle widget, which represents a loading animation.
/// It confirms that the loading indicator is properly rendered within the
/// widget.

void main() {
  testWidgets('LoadingBuildContent displays LoadingCycle',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingBuildContent(),
        ),
      ),
    );

    // Verify that the LoadingCycle widget is displayed.
    expect(find.byType(LoadingCycle), findsOneWidget);
  });
}
