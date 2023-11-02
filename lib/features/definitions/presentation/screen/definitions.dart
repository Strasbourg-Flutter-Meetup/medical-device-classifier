// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011134821
// 11.10.2023 13:48
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/definitions/presentation/cubits/definitions_cubit.dart';
import 'package:medical_device_classifier/features/definitions/presentation/cubits/definitions_state.dart';
import 'package:medical_device_classifier/mixins/content_builder.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';

class Definitions extends StatelessWidget {
  const Definitions({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<DefinitionsCubit>(
        create: (context) => getIt.get<DefinitionsCubit>()..initialize(),
        child: _DefinitionsContent(),
      );
}

class _DefinitionsContent extends StatelessWidget
    with ContentBuilderMixin<DefinitionsStateData> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<DefinitionsCubit>().state;

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(),
      child: buildContent(
        state: state,
        widget: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: UIConstants.maxWidth),
          child: state.data?.column,
        ),
      ),
    );
  }
}
