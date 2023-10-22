// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022142041
// 22.10.2023 14:20
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

/// A [StatelessWidget] tailored for displaying a list of bullet points.
///
/// `BulletList` takes a map object containing the details for the list and
/// presents each item as a bullet point. It extends [StatelessWidgetTemplate],
/// which presumably provides foundational methods and properties for widgets.
class BulletList extends StatelessWidgetTemplate {

  /// Constructs a `BulletList` widget using the provided map object.
  ///
  /// The [object] parameter must contain a valid list that can be
  /// presented to the user as bullet points. This class will validate the
  /// provided object to ensure it adheres to the expected structure.
  ///
  /// @param key The widget's identifier key.
  /// @param object The map representation of the list.
  const BulletList({
    super.key,
    required super.object,
  });

  @override

  /// Builds the visual representation of the bullet list.
  ///
  /// This method structures the list with proper padding and creates bullet
  /// points for each item.
  ///
  /// @param context The build context.
  /// @returns A styled widget representing the bullet list.
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 12.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: getTextWidgets(
        object,
        'list',
      ),
    ),
  );

  @override

  /// Validates the structure and content of the provided object.
  ///
  /// This method ensures that every item in the list within the object is of
  /// type [String]. If the validation fails, it throws an [AtomicObjectIsNotStringException].
  ///
  /// @throws AtomicObjectIsNotStringException if any item in the list is not a string.
  void validateObject() {
    for (var value in object['list'] as List) {
      if (value is! String) {
        throw AtomicObjectIsNotStringException(
          subTagName: 'list',
        );
      }
    }
  }

  /// Converts the provided map object into a list of text widgets.
  ///
  /// This method extracts the items from the given object using the provided key,
  /// and converts each item into a styled text widget with a bullet point.
  ///
  /// @param object The map representation of the list.
  /// @param key The key to access the list within the object.
  /// @returns A list of styled text widgets representing the bullet points.
  List<Widget> getTextWidgets(Map<String, dynamic> object, String key) {
    final output = <Widget>[];

    final list = object[key] as List<dynamic>;

    for (String text in list.cast()) {
      final widget = Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 3.0,
          bottom: 3.0,
        ),
        child: Text(
          '\u2022 $text',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

      output.add(widget);
    }

    return output;
  }
}

