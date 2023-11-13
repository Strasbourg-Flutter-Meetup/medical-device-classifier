// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231113193546
// 13.11.2023 19:35

import 'package:flutter/material.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';

class LegalNoticeContent extends StatelessWidget {
  const LegalNoticeContent({
    super.key,
    this.showHeadline = true,
  });

  final bool showHeadline;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          showHeadline
              ? Column(
                  children: [
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          context.appLocalizations?.legalNoticeTitle ?? '',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                  ],
                )
              : const SizedBox(
                  height: 12.0,
                ),
          Text(
            context.appLocalizations?.legalNoticeSubtitle1 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText1 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeSubtitle2 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText2 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeSubtitle3 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText3 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeSubtitle4 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText4 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeSubtitle5 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText5 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeSubtitle6 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText6 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeSubtitle7 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText7 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
          Text(
            context.appLocalizations?.legalNoticeText8 ?? '',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      );
}
