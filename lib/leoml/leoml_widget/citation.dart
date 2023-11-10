// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022141446
// 22.10.2023 14:14
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

/// A [StatelessWidget] tailored for displaying citation content.
///
/// `Citation` takes a map object containing the details for the citation and
/// presents it in a formatted manner. It extends [StatelessWidgetTemplate],
/// which presumably provides some foundational methods and properties for widgets.
class Citation extends StatelessWidgetTemplate {
  /// Constructs a `Citation` widget using the provided map object.
  ///
  /// The [object] parameter must contain a valid citation that can be
  /// presented to the user. This class will validate the provided object
  /// to ensure it adheres to the expected structure.
  ///
  /// @param key The widget's identifier key.
  /// @param object The map representation of the citation.
  const Citation({
    super.key,
    required super.object,
  });

  @override

  /// Builds the visual representation of the citation.
  ///
  /// This method structures the citation with proper padding and stylizes
  /// the text to be italicized, reflecting the typical format for citations.
  ///
  /// @param context The build context.
  /// @returns A styled widget representing the citation.
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        child: Text(
          object[citation] as String,
          style: const TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
          ),
        ),
      );

  @override

  /// Validates the structure and content of the provided object.
  ///
  /// This method ensures that the citation within the object is of type [String].
  /// If the validation fails, it throws an [AtomicObjectIsNotStringException].
  ///
  /// @throws AtomicObjectIsNotStringException if the citation is not a string.
  void validateObject() {
    if (object[citation] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: citation,
      );
    }
  }
}
