// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011130200
// 11.10.2023 13:02
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/mdc_web_footer/mdc_web_footer_content.dart';

/// A Flutter widget representing the footer for the web version of the app.
///
/// The [WebFooter] widget is responsible for displaying the footer content in
/// the web version of the app. It constrains its width to [UIConstants.maxWidthHalf]
/// and provides a colored background with rounded corners. The content of the
/// footer is wrapped in a [WebFooterContent] widget.
class WebFooter extends StatelessWidget {
  /// Creates an instance of [WebFooter].
  ///
  /// The [key] parameter is optional and can be used to provide a [Key] to
  /// the widget.
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: double.infinity,
          ),
          height: 224.0,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? const Color(0xFFC3E8FF)
                : const Color(0xFF004c69),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: const WebFooterContent(),
        ),
      );
}
