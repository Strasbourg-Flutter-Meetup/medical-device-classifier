// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011125329
// 11.10.2023 12:53
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/routing/router.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) => ScreenTemplate(
        appBarTemplate: const AppBarTemplate(
          isDashboard: true,
        ),
        child: Column(
          children: [
            const Text(
              'Here will be the dashboard of the Medical Device Classifier application',
            ),
            const SizedBox(
              height: 96.0,
            ),
            ElevatedButton(
              onPressed: () {
                routeToDefinitions();
              },
              child: const Text(
                'Definitions',
              ),
            ),
          ],
        ),
      );
}
