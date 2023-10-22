// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021141514
// 21.10.2023 14:15
import 'package:flutter/material.dart';
import 'package:leoml_parser/leoml_parser.dart';

/// A Flutter widget for rendering structured content within an expansion tile.
///
/// The [ExpansionTileContent] widget is designed to display structured content
/// within an expansion tile. It can render various types of content such as
/// sections, headlines, paragraphs, images, citations, and lists.
class ExpansionTileContent extends StatelessWidgetTemplate {
  /// Constructs an [ExpansionTileContent] widget.
  ///
  /// The [object] parameter is a required [Map] containing structured data that
  /// defines the content to be displayed within the [ExpansionTileContent].
  const ExpansionTileContent({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];

    // Extract the content list from the provided object.
    final contentList = object[content] as List;

    for (Map<String, dynamic> map in contentList.cast()) {
      Widget widget = const Placeholder();

      // Determine the appropriate widget based on the content type.
      widget = _getWidget(map, widget);

      // Add the widget with padding to the list of widgets.
      widgetList.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: widget,
        ),
      );
    }

    // Display the structured content in a column layout.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }

  /// Determines the appropriate widget based on the content type defined in the [map].
  ///
  /// The [map] parameter is a [Map] containing structured content data.
  ///
  /// Returns the corresponding widget based on the content type.
  Widget _getWidget(Map<String, dynamic> map, Widget widget) {
    switch (map.keys.first) {
      case section:
        widget = Text(
          map[section] as String,
          style: const TextStyle(fontSize: 16),
        );
        break;
      case sectionHeadline:
        widget = Text(
          map[sectionHeadline] as String,
          style: const TextStyle(fontSize: 18),
        );
        break;
      case paragraphHeadline:
        widget = Text(
          map[paragraphHeadline] as String,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        );
        break;
      case paragraph:
        widget = Text(
          map[paragraph] as String,
          style: const TextStyle(fontSize: 14),
        );
        break;
      case image:
        widget = Column(
          children: [
            Image.network(
              map[image][imageURL] as String,
            ),
            // Display image description if available.
            if ((object[content][image] as Map).containsKey(imageDescription))
              Column(
                children: [
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    map[image][imageDescription] as String,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
          ],
        );
        break;
      case citation:
        widget = Text(
          map[paragraph] as String,
          style: const TextStyle(fontSize: 16),
        );
        break;
      case list:
        widget = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getTextWidgets(
            map,
            list,
          ),
        );
        break;
      default:
        widget = const Placeholder();
    }
    return widget;
  }

  @override
  void validateObject() {}

  /// Converts a list of strings into a list of text widgets with bullet points.
  ///
  /// The [object] parameter is a [Map] containing structured content data,
  /// and the [key] parameter specifies the key for the list of strings.
  ///
  /// Returns a list of text widgets with bullet points for each string.
  List<Widget> getTextWidgets(Map<String, dynamic> object, String key) {
    final output = <Widget>[];

    // Extract the list of strings from the provided object.
    final list = object[key] as List;

    for (String text in list.cast()) {
      // Create a text widget with a bullet point.
      final widget = Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 3.0,
        ),
        child: Text(
          '\u2022 $text',
          style: const TextStyle(fontSize: 16),
        ),
      );

      output.add(widget);
    }

    return output;
  }
}
