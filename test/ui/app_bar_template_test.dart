// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012123213
// 12.10.2023 12:32
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';

void main() {
  testWidgets('AppBarTemplate displays title', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AppBarTemplate(),
        ),
      ),
    );

    // Verify that the title text is displayed.
    expect(
      find.text(
        AppLocalizations.of(tester.element(find.byType(AppBarTemplate)))
                ?.appBarTitle ??
            'Medical Device Identifier',
      ),
      findsOneWidget,
    );
  });

  testWidgets('AppBarTemplate displays back button on mobile',
      (WidgetTester tester) async {
    // Build our widget with isDashboard as false (mobile view) and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AppBarTemplate(isDashboard: false),
        ),
      ),
    );

    // Verify that a back button is displayed on mobile.
    expect(find.byType(BackButton), findsOneWidget);
  });

  testWidgets('AppBarTemplate displays account tree icon on web',
      (WidgetTester tester) async {
    // Build our widget with isDashboard as true (web view) and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: AppBarTemplate(isDashboard: true),
        ),
      ),
    );

    // Verify that an account tree icon is displayed on web.
    expect(find.byIcon(Icons.account_tree_outlined), findsOneWidget);
  });
}
