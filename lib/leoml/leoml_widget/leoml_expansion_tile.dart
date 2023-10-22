// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021143014
// 21.10.2023 14:30
import 'package:flutter/material.dart';

/// A customized Flutter widget that wraps an [ExpansionTile] with specific styling.
///
/// The [LeoExpansionTile] widget is designed to display content within an [ExpansionTile]
/// with custom styling, such as rounded corners and a border color.
class LeoExpansionTile extends StatelessWidget {
  /// Constructs a [LeoExpansionTile] widget with a header and content.
  ///
  /// The [header] parameter is a required [Widget] that serves as the title/header
  /// of the expansion tile.
  ///
  /// The [content] parameter is a required [Widget] that represents the content
  /// that expands when the tile is opened.
  const LeoExpansionTile({
    super.key,
    required this.header,
    required this.content,
  });

  /// The widget to display as the header/title of the expansion tile.
  final Widget header;

  /// The widget to display as the content of the expansion tile when it is expanded.
  final Widget content;

  @override
  Widget build(BuildContext context) => ExpansionTile(
    // Custom shape with rounded corners and a border color.
    shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: Colors.amber),
    ),
    collapsedShape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: Colors.amber),
    ),
    title: header,
    children: [
      content,
    ],
  );
}

