// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021213512
// 21.10.2023 21:35
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

/// A [StatelessWidget] tailored for displaying headline content.
///
/// `Headline` takes a map object containing the details for the headline and
/// presents it in a bold, prominent manner. It extends [StatelessWidgetTemplate],
/// which presumably provides foundational methods and properties for widgets.
class Headline extends StatelessWidgetTemplate {

  /// Constructs a `Headline` widget using the provided map object.
  ///
  /// The [object] parameter must contain a valid headline that can be
  /// presented to the user. This class will validate the provided object
  /// to ensure it adheres to the expected structure.
  ///
  /// @param key The widget's identifier key.
  /// @param object The map representation of the headline.
  const Headline({
    super.key,
    required super.object,
  });

  @override

  /// Builds the visual representation of the headline.
  ///
  /// This method structures the headline with proper padding and stylizes
  /// the text to be bold, reflecting the importance and prominence of headlines.
  ///
  /// @param context The build context.
  /// @returns A styled widget representing the headline.
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0,),
    child: Text(
      object[headline] as String,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override

  /// Validates the structure and content of the provided object.
  ///
  /// This method ensures that the headline within the object is of type [String].
  /// If the validation fails, it throws an [AtomicObjectIsNotStringException].
  ///
  /// @throws AtomicObjectIsNotStringException if the headline is not a string.
  void validateObject() {
    if (object[headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: headline,
      );
    }
  }
}
