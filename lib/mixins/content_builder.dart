// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021211438
// 21.10.2023 21:14
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/state_management/states.dart';
import 'package:medical_device_classifier/ui/content_builder.dart';
import 'package:medical_device_classifier/ui/widgets/error_building_content.dart';
import 'package:medical_device_classifier/ui/widgets/loading_content.dart';

mixin ContentBuilderMixin<T> {
  Widget buildContent({
    required StateTemplate<T> state,
    ContentBuilder<T>? contentBuilder,
    Widget? widget,
  }) {
    switch (state.type) {
      case StateTemplateType.initial:
      case StateTemplateType.loading:
        // Display a loading indicator.
        return const LoadingBuildContent();
      case StateTemplateType.error:
        // Display an error message.
        return const ErrorBuildingContent();
      default:
        final stateData = state.data;

        // If stateData is null, display an error message.
        if (stateData == null) {
          return const ErrorBuildingContent(
            errorMessage: 'No data available.',
          );
        }

        // Display the dashboard content.
        if (contentBuilder != null) {
          return contentBuilder.build(data: stateData);
        }

        if (widget != null) {
          return widget;
        }

        return const Placeholder();
    }
  }
}
