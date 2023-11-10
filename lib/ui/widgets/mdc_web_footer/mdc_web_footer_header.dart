// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231110190702
// 10.11.2023 19:07
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/routing/router.dart';

/// A Flutter widget representing the header of a web footer.
///
/// The [MDCWebFooterHeader] widget is responsible for rendering the header
/// of a web footer. It includes an icon and the application title. The header
/// is designed with predefined styling and layout to maintain a consistent
/// appearance.
class MDCWebFooterHeader extends StatelessWidget {
  /// Creates an instance of [MDCWebFooterHeader].
  ///
  /// The [key] parameter is optional and can be used to provide a [Key] to
  /// the widget.
  const MDCWebFooterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const IconButton(
            onPressed: goToHome,
            icon: Icon(
              Icons.account_tree_outlined,
              color: Colors.black,
              size: 40.0,
            ),
          ),
          const SizedBox(
            width: 24.0,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 100.0),
            child: Text(
              context.appLocalizations?.appBarTitle ?? '',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
