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
/// A mixin that provides a method for building content based on the state of a
/// [StateTemplate] with a specific data type [T].
mixin ContentBuilderMixin<T> {
  /// Builds content based on the state provided.
  ///
  /// Depending on the [StateTemplate] type, this method constructs and returns
  /// different widgets to represent the content.
  ///
  /// [state]: The [StateTemplate] representing the current state.
  ///
  /// [contentBuilder]: A [ContentBuilder] used to construct content based on
  /// the state's data.
  ///
  /// [widget]: A custom widget to be used if [contentBuilder] is not provided.
  ///
  /// Returns a widget representing the constructed content.
  Widget buildContent({
    required StateTemplate<T> state,
    ContentBuilder<T>? contentBuilder,
    Widget? widget,
  }) {
    switch (state.type) {
      case StateTemplateType.initial:
        return _buildInitialContent();
      case StateTemplateType.loading:
        return _buildLoadingContent(state.data, contentBuilder, widget);
      case StateTemplateType.error:
        return _buildErrorContent();
      default:
        return _buildDefaultContent(state.data, contentBuilder, widget);
    }
  }

  Widget _buildInitialContent() {
    return const LoadingBuildContent();
  }

  Widget _buildLoadingContent(
      T? data,
      ContentBuilder<T>? contentBuilder,
      Widget? widget,
      ) {
    if (data != null) {
      return contentBuilder?.build(data: data) ?? widget ?? const Placeholder();
    } else {
      return const LoadingBuildContent();
    }
  }

  Widget _buildErrorContent() {
    return const ErrorBuildingContent();
  }

  Widget _buildDefaultContent(
      T? data,
      ContentBuilder<T>? contentBuilder,
      Widget? widget,
      ) {
    if (data != null) {
      return contentBuilder?.build(data: data) ?? widget ?? const Placeholder();
    } else {
      return const ErrorBuildingContent(errorMessage: 'No data available.');
    }
  }
}

