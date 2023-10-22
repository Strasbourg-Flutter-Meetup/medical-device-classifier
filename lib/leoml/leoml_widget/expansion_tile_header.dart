// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021142823
// 21.10.2023 14:28
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

/// A Flutter widget for rendering an expansion tile header with customizable styling.
///
/// The [ExpansionTileHeader] widget is designed to display a header within an
/// expansion tile. It can render a headline and an optional subheadline with
/// customizable text styles.
class ExpansionTileHeader extends StatelessWidgetTemplate {
  /// Constructs an [ExpansionTileHeader] widget with structured data.
  ///
  /// The [object] parameter is a required [Map] containing structured data that
  /// defines the content and styling of the header.
  const ExpansionTileHeader({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Display the headline with a custom text style.
      Text(
        object[header][headline] as String,
        style: const TextStyle(fontSize: 20),
      ),
      // Display the subheadline if available with a custom text style.
      if ((object[header] as Map).containsKey(subHeadline))
        Text(
          object[header][subHeadline] as String,
          style: const TextStyle(fontSize: 16),
        ),
    ],
  );

  @override
  void validateObject() {
    // Validate that the headline is a string.
    if (object[header][headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: '$header --> $headline',
      );
    }

    // Validate the subheadline (if available) is a string.
    if ((object[header] is Map) &&
        (object[header] as Map).containsKey(subHeadline) &&
        object[header][headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: '$header --> $subHeadline',
      );
    }
  }
}

