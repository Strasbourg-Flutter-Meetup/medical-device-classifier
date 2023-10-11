// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011134821
// 11.10.2023 13:48
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';

class Definitions extends StatelessWidget {
  const Definitions({super.key});

  @override
  Widget build(BuildContext context) => const ScreenTemplate(
        appBarTemplate: AppBarTemplate(),
        child: Column(
          children: [
            Text('Second screen'),
          ],
        ),
      );
}
