// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231030140025
// 30.10.2023 14:00
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/cubits/classification_state.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/widgets/classification_build_content.dart';
import 'package:medical_device_classifier/ui/content_builder.dart';

/// A builder class for building the content of the Classification screen.
/// It extends the [ContentBuilder] class and is specifically designed to build
/// content using [ClassificationStateData] as input data.
class ClassificationBuildContentBuilder
    extends ContentBuilder<ClassificationStateData> {
  @override
  Widget build({required ClassificationStateData data}) {
    // Constructs and returns the [ClassificationBuildContent] widget with the
    // provided [data].
    return ClassificationBuildContent(data: data);
  }
}
