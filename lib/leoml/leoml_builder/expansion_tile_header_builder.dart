// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021142726
// 21.10.2023 14:27
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/leoml/leoml_widget/expansion_tile_header.dart';

/// A Flutter widget builder for creating an [ExpansionTileHeader] widget.
///
/// The [ExpansionTileHeaderBuilder] is used to construct an [ExpansionTileHeader] widget
/// from structured data contained within a [Map].
class ExpansionTileHeaderBuilder extends LeoMLWidgetBuilder {
  /// Builds and returns an [ExpansionTileHeader] widget using the provided [object] data.
  ///
  /// The [object] parameter is a required [Map] containing structured data that
  /// defines the content and properties of the [ExpansionTileHeader].
  ///
  /// The returned [ExpansionTileHeader] widget is constructed with the provided
  /// [object] data, and the [validateObject] method is called to perform any
  /// necessary validation.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// ExpansionTileHeaderBuilder().build(object: myDataMap);
  /// ```
  @override
  Widget build({required Map<String, dynamic> object}) =>
      ExpansionTileHeader(object: object)..validateObject();
}
