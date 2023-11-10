// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011134821
// 11.10.2023 13:48
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';

/// A Flutter widget that displays definitions content.
///
/// The [Definitions] widget is responsible for displaying definitions content
/// within the app. It wraps its content in a [BlocProvider] to provide the
/// necessary [DefinitionsCubit] to its child widget. The [DefinitionsCubit] is
/// initialized during the widget's creation.
class Definitions extends StatelessWidget {
  /// Creates an instance of [Definitions].
  ///
  /// The [key] parameter is optional and can be used to provide a [Key] to
  /// the widget.
  const Definitions({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<DefinitionsCubit>(
        create: (context) => getIt.get<DefinitionsCubit>()..initialize(),
        child: _DefinitionsContent(),
      );
}

/// A private Flutter widget for building the content of the definitions screen.
///
/// The [_DefinitionsContent] widget is responsible for building the content
/// of the definitions screen. It utilizes the [ContentBuilderMixin] to handle
/// the state management and content rendering. The content is displayed within
/// a [ScreenTemplate] and is constrained to a maximum width defined by
/// [UIConstants.maxWidth].
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
      );
}
