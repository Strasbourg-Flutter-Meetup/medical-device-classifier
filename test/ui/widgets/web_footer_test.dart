// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012123943
// 12.10.2023 12:39
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/ui/web_footer.dart';

void main() {
  testWidgets('WebFooter displays the correct text',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: WebFooter(),
      ),
    );

    // Verify that the WebFooter displays the correct text.
    expect(find.text('I am a footer'), findsOneWidget);
  });
}
