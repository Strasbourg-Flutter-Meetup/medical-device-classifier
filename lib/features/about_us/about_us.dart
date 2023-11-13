// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231113124512
// 13.11.2023 12:45
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget representing the About Us screen.
///
/// The [AboutUs] widget displays information about the Strasbourg Flutter Meetup Group.
/// It includes an image, a title, subtitles, and text sections to provide details about
/// the group and its goals. Additionally, there is a button that allows users to
/// navigate to the Strasbourg Flutter Meetup Group page on Meetup.com.
class AboutUs extends StatelessWidget {
  /// Creates an [AboutUs] widget.
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) => ScreenTemplate(
    appBarTemplate: const AppBarTemplate(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 12.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/strasbourg_flutter_meetup_group.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.aboutUsTitle ?? '',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.appLocalizations?.aboutUsSubtitle1 ?? '',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    context.appLocalizations?.aboutUsText1 ?? '',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.appLocalizations?.aboutUsSubtitle2 ?? '',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    context.appLocalizations?.aboutUsText2 ?? '',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.appLocalizations?.aboutUsSubtitle3 ?? '',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    context.appLocalizations?.aboutUsText3 ?? '',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 48.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {
                          !await launchUrl(
                            Uri.parse(
                              'https://www.meetup.com/strasbourg-flutter-meetup-group/',
                            ),
                          );
                        },
                        child: Text(
                          context.appLocalizations?.aboutUsMeetUpButton ??
                              '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

