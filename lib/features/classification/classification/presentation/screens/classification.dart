// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231029140416
// 29.10.2023 14:04
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/cubits/classification_cubit.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/cubits/classification_state.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/widgets/classification_build_content_builder.dart';
import 'package:medical_device_classifier/mixins/content_builder.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';

/// A widget representing the Classification screen.
class Classification extends StatelessWidget {
  /// Creates a [Classification] widget.
  const Classification({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<ClassificationCubit>(
        create: (context) => getIt.get<ClassificationCubit>()
          ..initialize()
          ..listenToGlobalEventBus(),
        child: _ClassificationContent(),
      );
}

class _ClassificationContent extends StatefulWidget
    with ContentBuilderMixin<ClassificationStateData> {
  @override
  State<_ClassificationContent> createState() => _ClassificationContentState();
}

class _ClassificationContentState extends State<_ClassificationContent>
    with ContentBuilderMixin<ClassificationStateData> {
  ClassificationCubit? _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ClassificationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ClassificationCubit>().state;

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(),
      child: buildContent(
        state: state,
        contentBuilder: ClassificationBuildContentBuilder(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    unawaited(
      _cubit?.cancelGlobalEventBusSubscription(),
    );
  }
}
