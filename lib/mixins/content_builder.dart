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
import 'package:medical_device_classifier/ui/widgets/error_building_content.dart';
import 'package:medical_device_classifier/ui/widgets/loading_content.dart';

/// A mixin for building content based on a [StateTemplate].
///
/// The [ContentBuilder] mixin provides a method, [buildContent], that can be
/// used to build content based on the state of a [StateTemplate]. It is typically
/// used in conjunction with widgets that have dynamic content based on data
/// loading states, such as initial loading, error, or data available states.
///
/// To use this mixin, a class must implement the [StateTemplate] interface,
/// which defines the state information required to build the content.
///
/// Example usage:
///
/// ```dart
/// class MyWidget extends StatelessWidget with ContentBuilder<int> {
///   final StateTemplate<int> state;
///
///   MyWidget({required this.state});
///
///   @override
///   Widget build(BuildContext context) {
///     return buildContent(
///       state: state,
///       widget: MyDataWidget(data: state.data),
///     );
///   }
/// }
/// ```
mixin ContentBuilder<T> {
  /// Builds content based on the provided [StateTemplate].
  ///
  /// This method takes a [state] object of type [StateTemplate] and a [widget]
  /// that represents the content to be displayed. It switches between different
  /// states of the [state] object and returns the appropriate widget based on
  /// the state type.
  ///
  /// - If the state is [StateTemplateType.initial] or [StateTemplateType.loading],
  ///   it displays a loading indicator.
  /// - If the state is [StateTemplateType.error], it displays an error message.
  /// - For other states, if the data is available, it displays the provided [widget],
  ///   and if the data is null, it displays an error message with the specified
  ///   error message.
  ///
  /// Parameters:
  /// - `state`: The [StateTemplate] object representing the state of the content.
  /// - `widget`: The widget to display when the data is available.
  ///
  /// Returns:
  /// A widget representing the content based on the state.
  Widget buildContent({
    required StateTemplate<T> state,
    required Widget widget,
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
        return widget;
    }
  }
}
