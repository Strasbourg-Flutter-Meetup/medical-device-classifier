// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231114102127
// 14.11.2023 10:21
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/features/privacy_policy/widgets/privacy_policy_content.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) => ScreenTemplate(
        appBarTemplate: const AppBarTemplate(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: UIConstants.maxWidthHalf,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: PrivacyPolicyContent(),
          ),
        ),
      );
}
