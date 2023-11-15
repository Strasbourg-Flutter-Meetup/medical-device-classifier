// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022140256
// 22.10.2023 14:02
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/implementing_rules/presentation/cubits/implementing_rules_cubit.dart';
import 'package:medical_device_classifier/features/implementing_rules/presentation/cubits/implementing_rules_state.dart';
import 'package:medical_device_classifier/mixins/content_builder.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/widget/app_bar_template.dart';

/// Represents the top-level widget for implementing rules.
///
/// This widget sets up the `ImplementingRulesCubit` which fetches and structures
/// the implementing rules. It then delegates the presentation details
/// to its child `_ImplementingRulesContent`.
class ImplementingRules extends StatelessWidget {
  /// Constructs an instance of `ImplementingRules`.
  const ImplementingRules({super.key});

  @override

  /// Builds the `ImplementingRules` widget tree.
  ///
  /// It initializes a `BlocProvider` for `ImplementingRulesCubit` and sets up
  /// `_ImplementingRulesContent` as its child.
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt.get<ImplementingRulesCubit>()
          ..initialize()
          ..listenToGlobalEventBus(),
        child: _ImplementingRulesContent(),
      );
}

/// Represents the content part of the `ImplementingRules` widget.
///
/// This private widget is responsible for presenting the structured data
/// fetched and processed by `ImplementingRulesCubit`. It uses a content builder
/// pattern to determine the visual representation of the implementing rules.
class _ImplementingRulesContent extends StatefulWidget
    with ContentBuilderMixin<ImplementingRulesStateData> {
  @override
  State<_ImplementingRulesContent> createState() =>
      _ImplementingRulesContentState();
}

class _ImplementingRulesContentState extends State<_ImplementingRulesContent>
    with ContentBuilderMixin<ImplementingRulesStateData> {
  ImplementingRulesCubit? _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ImplementingRulesCubit>();
  }

  /// Builds the `_ImplementingRulesContent` widget tree.
  ///
  /// The method fetches the current state from `ImplementingRulesCubit`
  /// and structures it into the desired presentation format.
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ImplementingRulesCubit>().state;

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
