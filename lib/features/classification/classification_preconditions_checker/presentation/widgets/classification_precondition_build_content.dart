// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024145553
// 24.10.2023 14:55
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/extensions/build_context_extension.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/cubits/classification_precondition_state.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/cubits/classification_preconditions_cubit.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/widgets/classification_preconditions_checkbox.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/widgets/continue_button.dart';
import 'package:medical_device_classifier/ui/content_builder.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/sticky_note.dart';

/// A content builder for the classification preconditions screen.
///
/// The [ClassificationPreconditionsBuildContentBuilder] class is responsible for
/// building the content of the classification preconditions screen based on the
/// provided state data. It creates an instance of [ClassificationPreconditionsBuildContent]
/// and passes the state data to it.
///
/// Example:
///
/// ```dart
/// final contentBuilder = ClassificationPreconditionsBuildContentBuilder();
/// final content = contentBuilder.build(data: stateData);
/// ```
class ClassificationPreconditionsBuildContentBuilder
    extends ContentBuilder<ClassificationPreconditionsStateData> {
  @override
  Widget build({required ClassificationPreconditionsStateData data}) {
    return ClassificationPreconditionsBuildContent(data: data);
  }
}

/// A widget representing the content of the classification preconditions screen.
///
/// The [ClassificationPreconditionsBuildContent] widget displays the content of the
/// classification preconditions screen. It receives the state data and uses it to build
/// various UI elements, including checkboxes and a continue button. It also listens
/// to user interactions and communicates with the [ClassificationPreconditionsCubit]
/// to update the state.
///
/// Example:
///
/// ```dart
/// final contentWidget = ClassificationPreconditionsBuildContent(data: stateData);
/// ```
class ClassificationPreconditionsBuildContent extends StatelessWidget {
  const ClassificationPreconditionsBuildContent({
    super.key,
    required this.data,
  });

  final ClassificationPreconditionsStateData data;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClassificationPreconditionsCubit>();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: UIConstants.maxWidthHalf),
      child: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          ClassificationPreconditionsCheckbox(
            title: context.appLocalizations
                    ?.classificationPreconditionsIsMedicalTitle ??
                '',
            value: data.isMedicalProduct,
            onChanged: (value) {
              cubit.updateIsMedicalProduct(
                isMedicalProduct: value ?? false,
              );
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          ClassificationPreconditionsCheckbox(
            title: context.appLocalizations
                    ?.classificationPreconditionsKnowsAboutDefinitionsTitle ??
                '',
            value: data.knowsAboutDefinitions,
            onChanged: (value) {
              cubit.updateKnowsAboutDefinitions(
                knowsAboutDefinitions: value ?? false,
              );
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          ClassificationPreconditionsCheckbox(
            title: context.appLocalizations
                    ?.classificationPreconditionsKnowsAboutImplementingRulesTitle ??
                '',
            value: data.knowsAboutImplementingRules,
            onChanged: (value) {
              cubit.updateKnowsAboutImplementingRules(
                knowsAboutImplementingRules: value ?? false,
              );
            },
          ),
          const SizedBox(
            height: 48.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: StickyNote(
              content: Text(
                context.appLocalizations?.classificationPreconditionsWarningText ??
                    '',
              ),
              title: context
                      .appLocalizations?.classificationPreconditionsWarningTitle ??
                  '',
              type: StickyNoteMessageType.warning,
            ),
          ),
          const SizedBox(
            height: 128.0,
          ),
          ContinueButton(
            isActive: data.continueButtonIsActive,
          ),
        ],
      ),
    );
  }
}
