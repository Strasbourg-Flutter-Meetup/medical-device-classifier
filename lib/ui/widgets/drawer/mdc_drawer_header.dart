// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231110191021
// 10.11.2023 19:10
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';

/// A Flutter widget representing the header of a Material Design (MDC) drawer.
///
/// The [MDCDrawerHeader] widget is used to create the header section of an MDC
/// drawer, which typically contains the app logo or title. It provides a
/// convenient way to create this header with predefined styling and structure.
class MDCDrawerHeader extends StatelessWidget {
  /// Creates an instance of [MDCDrawerHeader].
  ///
  /// The [key] parameter is optional and can be used to provide a [Key] to
  /// the widget.
  const MDCDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIConstants.mdcDrawerHeaderHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          // bottomLeft: Radius.circular(
          //   10.0,
          // ),
          bottomRight: Radius.circular(
            20.0,
          ),
        ),
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? const Color(0xFFC3E8FF)
            : const Color(0xFF004c69),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            const Icon(
              Icons.account_tree_outlined,
              size: 40.0,
            ),
            const SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: Text(
                context.appLocalizations?.appBarTitle ?? '',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
