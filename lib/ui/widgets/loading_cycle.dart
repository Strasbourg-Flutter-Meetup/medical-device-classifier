// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011205328
// 11.10.2023 20:53
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';

/// The [LoadingCycle] widget is a Flutter [StatelessWidget] that displays a
/// circular loading indicator in the form of a [CircularProgressIndicator].
/// This widget is commonly used to indicate that a process or operation is in
/// progress and the user should wait for it to complete.
class LoadingCycle extends StatelessWidget {
  /// Constructor for the [LoadingCycle] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for
  /// this widget.
  const LoadingCycle({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 3 -
                UIConstants.loadingCycleMaxHeight,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: UIConstants.loadingCycleMaxWidth,
              minWidth: UIConstants.loadingCycleMinWidth,
              maxHeight: UIConstants.loadingCycleMaxHeight,
              minHeight: UIConstants.loadingCycleMinHeight,
            ),
            child: const CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      );
}
