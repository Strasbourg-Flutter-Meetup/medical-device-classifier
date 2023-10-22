// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021141340
// 21.10.2023 14:13
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/leoml/leoml_widget/expansion_tile_content.dart';

/// A Flutter widget builder for creating an [ExpansionTileContent] widget.
///
/// This builder is used to construct an [ExpansionTileContent] widget from a
/// given [Map] of data.
class ExpansionTileContentBuilder extends LeoMLWidgetBuilder {
  /// Builds and returns an [ExpansionTileContent] widget using the provided [object] data.
  ///
  /// The [object] parameter is a required [Map] containing the data needed to
  /// construct the [ExpansionTileContent] widget.
  ///
  /// The returned [ExpansionTileContent] widget is constructed with the provided
  /// [object] data, and the [validateObject] method is called to perform any
  /// necessary validation.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// ExpansionTileContentBuilder().build(object: myDataMap);
  /// ```
  @override
  Widget build({required Map<String, dynamic> object}) =>
      ExpansionTileContent(object: object)..validateObject();
}
