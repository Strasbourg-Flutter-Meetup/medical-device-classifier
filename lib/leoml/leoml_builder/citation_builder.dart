// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022141609
// 22.10.2023 14:16
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/leoml/leoml_widget/citation.dart';

/// A widget builder tailored for creating citation widgets based on LeoML specifications.
///
/// This builder is specifically designed to handle LeoML data structures that
/// represent citations. It extends the `LeoMLWidgetBuilder` which presumably
/// offers a general interface for building widgets from LeoML data structures.
class CitationBuilder extends LeoMLWidgetBuilder {

  @override

  /// Builds a `Citation` widget based on the given LeoML object.
  ///
  /// This method takes in a LeoML object (provided as a map) and uses it
  /// to construct a `Citation` widget. After constructing, it ensures the
  /// citation object is validated.
  ///
  /// @param object The LeoML representation of the citation.
  /// @returns A `Citation` widget constructed from the LeoML object.
  Widget build({required Map<String, dynamic> object}) =>
      Citation(object: object)..validateObject();
}

