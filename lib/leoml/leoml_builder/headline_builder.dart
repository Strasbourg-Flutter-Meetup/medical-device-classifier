// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021213652
// 21.10.2023 21:36
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/leoml/leoml_widget/headline.dart';

/// A widget builder tailored for creating headline widgets based on LeoML specifications.
///
/// `HeadlineBuilder` is specifically designed to handle LeoML data structures
/// that represent headlines. It extends the `LeoMLWidgetBuilder` which
/// presumably offers a general interface for building widgets from LeoML data structures.
class HeadlineBuilder extends LeoMLWidgetBuilder {

  @override

  /// Builds a `Headline` widget based on the given LeoML object.
  ///
  /// This method takes in a LeoML object (provided as a map) and uses it
  /// to construct a `Headline` widget. After constructing, it ensures the
  /// headline object is validated.
  ///
  /// @param object The LeoML representation of the headline.
  /// @returns A `Headline` widget constructed from the LeoML object.
  Widget build({required Map<String, dynamic> object}) =>
      Headline(object: object)..validateObject();
}
