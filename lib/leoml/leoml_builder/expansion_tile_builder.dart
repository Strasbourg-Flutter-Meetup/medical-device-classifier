// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021142929
// 21.10.2023 14:29
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/leoml/leoml_widget/leoml_expansion_tile.dart';

/// A Flutter widget builder for creating an [LeoExpansionTile] widget.
///
/// The [ExpansionTileBuilder] is a specialized widget builder used to construct
/// [LeoExpansionTile] widgets with header and content.
class ExpansionTileBuilder extends CustomWidgetBuilder {
  /// Builds and returns a [LeoExpansionTile] widget with the provided [header] and [content].
  ///
  /// The [header] and [content] parameters are required [Widget]s that represent the
  /// header and content of the expansion tile.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// ExpansionTileBuilder().build(
  ///   header: myHeaderWidget,
  ///   content: myContentWidget,
  /// );
  /// ```
  @override
  Widget build({required Widget header, required Widget content}) =>
      LeoExpansionTile(
        header: header,
        content: content,
      );
}
