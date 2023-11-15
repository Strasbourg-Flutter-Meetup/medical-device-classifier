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
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';
/// A widget representing the legal notice screen.
///
/// This widget displays the legal notice content within a constrained box.
class LegalNotice extends StatelessWidget {
  /// Creates a [LegalNotice] widget.
  const LegalNotice({super.key});

  @override
  Widget build(BuildContext context) => ScreenTemplate(
    // Use the AppBarTemplate for the app bar.
    appBarTemplate: const AppBarTemplate(),

    // Wrap the legal notice content in a constrained box.
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: UIConstants.maxWidthHalf,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: LegalNoticeContent(),
      ),
    ),
  );
}


