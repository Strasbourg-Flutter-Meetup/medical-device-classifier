// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231110191144
// 10.11.2023 19:11
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/widgets/drawer/mdc_drawer_content.dart';
import 'package:medical_device_classifier/ui/widgets/drawer/mdc_drawer_header.dart';

/// A Flutter widget representing a Material Design (MDC) drawer.
///
/// The [MDCDrawer] widget is a standard drawer widget that conforms to the
/// Material Design guidelines. It typically contains a header and content.
/// This widget is a convenient way to create an MDC drawer with predefined
/// styling and structure.
class MDCDrawer extends StatelessWidget {
  /// Creates an instance of [MDCDrawer].
  ///
  /// The [key] parameter is optional and can be used to provide a [Key] to
  /// the widget.
  const MDCDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          MDCDrawerHeader(),
          MDCDrawerContent(),
        ],
      ),
    );
  }
}
