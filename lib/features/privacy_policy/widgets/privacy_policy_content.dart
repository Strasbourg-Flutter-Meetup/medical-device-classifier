// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231114102142
// 14.11.2023 10:21
import 'package:flutter/cupertino.dart';
import 'package:medical_device_classifier/extensions/build_context_extension.dart';
/// A widget that displays the content of a privacy policy using text components.
class PrivacyPolicyContent extends StatelessWidget {
  /// Creates a [PrivacyPolicyContent] widget.
  ///
  /// The [key] argument is optional.
  const PrivacyPolicyContent({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyMainTitle ?? '',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy2 ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy3 ?? '',
          ),
          const SizedBox(
            height: 32.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy4 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privatePolicyTitle4_1 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy5 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy6 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy7 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle8 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy9 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy10 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy11 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy12 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy13 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy14 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle15 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy16 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy17 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle18 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicySubtitle19 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy20 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy21 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicySubtitle22 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy23 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle25 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy26 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy27 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy28 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle29 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicySubtitle30 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy31 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy32 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy33 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy34 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy35 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy36 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy37 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicySubtitle38 ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy39 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy40 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy41 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle42 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy43 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle44 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy45 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy46 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle47 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy48 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy49 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle50 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy51 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle52 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy53 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy54 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy55 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle56 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy57 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy58 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle59 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy60 ?? '',
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicyTitle61 ?? '',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy62 ?? '',
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy63 ?? '',
          ), const SizedBox(
            height: 48.0,
          ),
          Text(
            context.appLocalizations?.privacyPolicy64 ?? '',
          ),
        ],
      );
}
