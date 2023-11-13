// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231113180651
// 13.11.2023 18:06
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/features/legal_notice/widgets/legal_notice_content.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';

class LegalNotice extends StatelessWidget {
  const LegalNotice({super.key});

  @override
  Widget build(BuildContext context) => const ScreenTemplate(
        appBarTemplate: AppBarTemplate(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: LegalNoticeContent(),
        ),
      );
}

