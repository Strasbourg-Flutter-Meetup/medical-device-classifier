// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011125329
// 11.10.2023 12:53
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/widgets/dashboard_build_content.dart';
import 'package:medical_device_classifier/mixins/content_builder.dart';
import 'package:medical_device_classifier/ui/app_bar_template.dart';
import 'package:medical_device_classifier/ui/screen_template.dart';

/// The [Dashboard] class is a Flutter `StatelessWidget` representing the main dashboard screen
/// for the Medical Device Classifier application.

class Dashboard extends StatelessWidget {
  /// Constructor for the [Dashboard] widget.
  ///
  /// [key] is an optional parameter that can be used to provide a key for this widget.

  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// This method builds the widget's UI.
    ///
    /// It uses a [BlocProvider] to provide the [DashboardCubit] and its initialization to the widget.
    /// The dashboard content is displayed using the [_DashboardContent] widget.

    return BlocProvider<DashboardCubit>(
      create: (context) => getIt.get<DashboardCubit>()..initialize(),
      child: const _DashboardContent(),
    );
  }
}

/// The [_DashboardContent] class is a private Flutter `StatelessWidget` representing the content
/// of the dashboard screen.

class _DashboardContent extends StatelessWidget
    with ContentBuilder<DashboardStateData> {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DashboardCubit>().state;

    /// This method returns a [ScreenTemplate] widget with an app bar template and the appropriate content.

    return ScreenTemplate(
      appBarTemplate: const AppBarTemplate(isDashboard: true),
      child: buildContent(
        state: state,
        widget: const DashboardBuildContent(),
      ),
    );
  }
}
