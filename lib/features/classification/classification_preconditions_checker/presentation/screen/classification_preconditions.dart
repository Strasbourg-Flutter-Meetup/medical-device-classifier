// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024145135
// 24.10.2023 14:51
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/cubits/classification_preconditions_cubit.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/cubits/classification_precondition_state.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/widgets/classification_precondition_build_content.dart';
import 'package:medical_device_classifier/mixins/content_builder.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';

/// A widget representing the classification preconditions screen.
///
/// The [ClassificationPrecondition] widget is responsible for displaying the
/// classification preconditions screen. It uses the [ClassificationPreconditionsCubit]
/// to manage the state of the screen. The cubit is created and initialized during
/// widget creation.
///
/// Example:
///
/// ```dart
/// final preconditionWidget = ClassificationPrecondition();
/// ```
class ClassificationPrecondition extends StatelessWidget {
  const ClassificationPrecondition({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider<ClassificationPreconditionsCubit>(
        create: (context) =>
        getIt.get<ClassificationPreconditionsCubit>()..initialize(),
        child: _ClassificationPreconditionCheckerContent(),
      );
}

/// A widget representing the content of the classification preconditions screen.
///
/// The [_ClassificationPreconditionCheckerContent] widget displays the content of the
/// classification preconditions screen. It uses the [ClassificationPreconditionsCubit]
/// to retrieve the current state and the [ContentBuilderMixin] to build the content based
/// on the state.
class _ClassificationPreconditionCheckerContent extends StatelessWidget
    with ContentBuilderMixin<ClassificationPreconditionsStateData> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ClassificationPreconditionsCubit>().state;

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(),
      child: buildContent(
        state: state,
        contentBuilder: ClassificationPreconditionsBuildContentBuilder(),
      ),
    );
  }
}

