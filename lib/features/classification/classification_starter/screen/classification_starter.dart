// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231023131420
// 23.10.2023 13:14
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/features/classification/classification_starter/widgets/classification_starter_build_content.dart';
import 'package:medical_device_classifier/features/classification/classification_starter/widgets/start_button.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';

/// A widget representing the starter screen for a classification task.
///
/// The [ClassificationStarter] widget provides a basic structure for a
/// classification task starter screen. It includes an app bar, the main content
/// of the classification task, and a start button.
///
/// Example usage:
///
/// ```dart
/// ClassificationStarter(),
/// ```
class ClassificationStarter extends StatelessWidget {
  /// Creates a [ClassificationStarter] widget.
  ///
  /// The `key` parameter can be used to provide a key that uniquely identifies
  /// this widget.
  const ClassificationStarter({super.key});

  @override
  Widget build(BuildContext context) =>  ScreenTemplate(
        appBarTemplate: const AppBarTemplate(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: UIConstants.maxWidthHalf),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClassificationStarterBuildContent(),
              SizedBox(
                height: 128.0,
              ),
              StartButton(),
            ],
          ),
        ),
      );
}
