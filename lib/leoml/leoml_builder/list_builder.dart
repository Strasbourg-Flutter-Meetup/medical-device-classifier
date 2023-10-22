// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022142316
// 22.10.2023 14:23
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/leoml/leoml_widget/list.dart';

/// A widget builder tailored for creating list widgets based on LeoML specifications.
///
/// `ListBuilder` is specifically designed to handle LeoML data structures
/// that represent lists, specifically bullet lists. It extends the `LeoMLWidgetBuilder`
/// which provides a general interface for building widgets from LeoML data structures.
class ListBuilder extends LeoMLWidgetBuilder {

  @override

  /// Constructs a `BulletList` widget using the provided LeoML object.
  ///
  /// This method accepts a LeoML object (provided as a map) and uses it to
  /// construct a `BulletList` widget. After constructing the widget, it
  /// ensures the bullet list object undergoes validation.
  ///
  /// @param object The LeoML representation of the bullet list.
  /// @returns A `BulletList` widget constructed from the LeoML object.
  Widget build({required Map<String, dynamic> object}) =>
      BulletList(object: object)..validateObject();
}
