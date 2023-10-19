// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016132419
// 16.10.2023 13:24
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_cubit.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';

class GeneralExplanationOfRules extends StatelessWidget {
  const GeneralExplanationOfRules({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            getIt.get<GeneralExplanationOfRulesCubit>()..initialize(),
        child: _GeneralExplanationOfRulesContent(),
      );
}

class _GeneralExplanationOfRulesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<GeneralExplanationOfRulesCubit>().state.data;

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(),
      child: data?.column ?? const Column(),
    );
  }
}
