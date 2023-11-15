// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016132419
// 16.10.2023 13:24
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_cubit.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_state.dart';
import 'package:medical_device_classifier/mixins/content_builder.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';

/// A widget that provides an overview or general explanation of rules.
///
/// This widget sets up a `BlocProvider` for `GeneralExplanationOfRulesCubit` and
/// displays the content using the `_GeneralExplanationOfRulesContent` widget.
class GeneralExplanationOfRules extends StatelessWidget {
  /// Constructs a `GeneralExplanationOfRules` widget.
  const GeneralExplanationOfRules({super.key});

  /// Describes the part of the user interface represented by this widget.
  ///
  /// Sets up a `BlocProvider` for `GeneralExplanationOfRulesCubit` and
  /// returns the `_GeneralExplanationOfRulesContent` widget.
  @override
  Widget build(BuildContext context) =>
      BlocProvider<GeneralExplanationOfRulesCubit>(
        create: (context) => getIt.get<GeneralExplanationOfRulesCubit>()
          ..initialize()
          ..listenToGlobalEventBus(),
        child: _GeneralExplanationOfRulesContent(),
      );
}

/// A widget that displays the content for the `GeneralExplanationOfRules`.
///
/// This widget listens to the `GeneralExplanationOfRulesCubit` state and
/// renders the content accordingly.
class _GeneralExplanationOfRulesContent extends StatefulWidget
    with ContentBuilderMixin<GeneralExplanationOfRulesStateData> {
  @override
  State<_GeneralExplanationOfRulesContent> createState() =>
      _GeneralExplanationOfRulesContentState();
}

class _GeneralExplanationOfRulesContentState
    extends State<_GeneralExplanationOfRulesContent>
    with ContentBuilderMixin<GeneralExplanationOfRulesStateData> {
  GeneralExplanationOfRulesCubit? _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<GeneralExplanationOfRulesCubit>();
  }

  /// Describes the part of the user interface represented by this widget.
  ///
  /// Uses the `ScreenTemplate` to structure the UI and utilizes the `ContentBuilder`
  /// to render the content based on the current state.
  @override
  Widget build(BuildContext context) {
    final state = context.watch<GeneralExplanationOfRulesCubit>().state;

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(),
      child: buildContent(
        state: state,
        widget: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: UIConstants.maxWidthHalf,
          ),
          child: state.data?.column,
        ),
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
