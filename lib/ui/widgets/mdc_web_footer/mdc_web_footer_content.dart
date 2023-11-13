// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231110190834
// 10.11.2023 19:08
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/routing/router.dart';
import 'package:medical_device_classifier/ui/widgets/mdc_web_footer/mdc_web_footer_header.dart';
import 'package:medical_device_classifier/ui/widgets/mdc_web_footer/mdc_web_footer_navigation_button.dart';

/// A Flutter widget representing the content of a web footer.
///
/// The [WebFooterContent] widget is responsible for rendering the content
/// of a web footer, including the header and navigation buttons. It uses
/// predefined styling and layout to create a consistent footer design.
class WebFooterContent extends StatelessWidget {
  /// Creates an instance of [WebFooterContent].
  ///
  /// The [key] parameter is optional and can be used to provide a [Key] to
  /// the widget.
  const WebFooterContent({super.key});

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          const MDCWebFooterHeader(),
          MDCWebFooterNavigationButton(
            buttonText: context.appLocalizations?.drawerAboutUs ?? '',
            onTap: routeToAboutUs,
          ),
          const SizedBox(
            width: 12.0,
          ),
          MDCWebFooterNavigationButton(
            buttonText: context.appLocalizations?.drawerDataProtection ?? '',
            onTap: () {},
          ),
          const SizedBox(
            width: 12.0,
          ),
          MDCWebFooterNavigationButton(
            buttonText: context.appLocalizations?.drawerLegalInformation ?? '',
            onTap: () {},
          ),
        ],
      );
}
