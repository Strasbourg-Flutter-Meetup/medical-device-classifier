// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231110190746
// 10.11.2023 19:07
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';

/// A Flutter widget representing a navigation button in a web footer.
///
/// The [MDCWebFooterNavigationButton] widget is used to create navigation buttons
/// in a web footer. It includes a text label and an `onTap` callback function
/// to handle user interactions. These buttons are designed with predefined
/// styling and layout for a consistent appearance.
class MDCWebFooterNavigationButton extends StatelessWidget {
  /// Creates an instance of [MDCWebFooterNavigationButton].
  ///
  /// The [key] parameter is optional and can be used to provide a [Key] to
  /// the widget.
  ///
  /// The [buttonText] parameter is required and specifies the text label
  /// displayed on the navigation button.
  ///
  /// The [onTap] parameter is required and defines the callback function
  /// triggered when the button is tapped.
  const MDCWebFooterNavigationButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  /// The text label displayed on the navigation button.
  final String buttonText;

  /// The callback function triggered when the button is tapped.
  final void Function() onTap;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: UIConstants.webFooterNavigationButtonMaxHeight,
          minHeight: UIConstants.webFooterNavigationButtonMinHeight,
          maxWidth: UIConstants.webFooterNavigationButtonMaxWidth,
          minWidth: UIConstants.webFooterNavigationButtonMinWidth,
        ),
        child: ListTile(
          title: Text(
            buttonText,
            style: const TextStyle(fontSize: 12.0),
          ),
          onTap: onTap,
        ),
      );
}
