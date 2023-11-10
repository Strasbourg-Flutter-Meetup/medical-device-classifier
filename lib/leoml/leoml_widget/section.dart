// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022141827
// 22.10.2023 14:18
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

/// A [StatelessWidget] tailored for displaying section content.
///
/// `Section` takes a map object containing the details for the section
/// and presents it with appropriate styling. It extends [StatelessWidgetTemplate],
/// which presumably provides foundational methods and properties for widgets.
class Section extends StatelessWidgetTemplate {
  /// Constructs a `Section` widget using the provided map object.
  ///
  /// The [object] parameter must contain a valid text representation
  /// of the section content. This class will validate the provided object
  /// to ensure it adheres to the expected structure.
  ///
  /// @param key The widget's identifier key.
  /// @param object The map representation of the section content.
  const Section({
    super.key,
    required super.object,
  });

  @override

  /// Builds the visual representation of the section content.
  ///
  /// This method structures the section content with proper padding and applies
  /// appropriate styling.
  ///
  /// @param context The build context.
  /// @returns A styled widget representing the section content.
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        child: Text(
          object[section] as String,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  @override

  /// Validates the structure and content of the provided object.
  ///
  /// This method ensures that the section content in the object is of
  /// type [String]. If the validation fails, it throws an [AtomicObjectIsNotStringException].
  ///
  /// @throws AtomicObjectIsNotStringException if the section content is not a string.
  void validateObject() {
    if (object[section] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: section,
      );
    }
  }
}
