// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022141921
// 22.10.2023 14:19
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/leoml/leoml_widget/section.dart';

/// A widget builder designed for creating section widgets based on LeoML specifications.
///
/// `SectionBuilder` is specifically tailored to handle LeoML data structures
/// that represent sections. It inherits from `LeoMLWidgetBuilder`, which
/// provides a generic interface for constructing widgets from LeoML data structures.
class SectionBuilder extends LeoMLWidgetBuilder {

  @override

  /// Constructs a `Section` widget using the provided LeoML object.
  ///
  /// This method takes in a LeoML object (provided as a map) and leverages it
  /// to create a `Section` widget. Following the construction of the widget,
  /// it ensures the section object is validated.
  ///
  /// @param object The LeoML representation of the section.
  /// @returns A `Section` widget built from the given LeoML object.
  Widget build({required Map<String, dynamic> object}) =>
      Section(object: object)..validateObject();
}
