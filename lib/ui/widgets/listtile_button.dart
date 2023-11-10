// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231023142532
// 23.10.2023 14:25
import 'package:flutter/material.dart';

/// A custom widget that combines the features of a ListTile and a Button.
///
/// The `ListTileButton` is a versatile widget that combines the appearance of a
/// ListTile with the interactivity of a button. It can be used to create items
/// in lists or grids that are tappable and can trigger actions when tapped.
///
/// Parameters:
///
/// - `title`: The primary content of the ListTileButton, typically displayed as
///   the main text.
///
/// - `onTap`: A callback function that is invoked when the ListTileButton is
///   tapped. It allows you to specify the action to be performed when the item
///   is selected.
///
/// - `subtitle`: An optional secondary content of the ListTileButton, typically
///   displayed below the `title`.
///
/// - `leading`: An optional leading widget displayed at the beginning of the
///   ListTileButton, such as an icon or image.
///
/// Example usage:
///
/// ```dart
/// ListTileButton(
///   title: Text('Item 1'),
///   onTap: () {
///     // Perform an action when Item 1 is tapped.
///   },
///   subtitle: Text('Additional information'),
///   leading: Icon(Icons.star),
/// )
/// ```
///
/// This widget is especially useful for creating interactive items within lists,
/// drawers, or any other scenario where a combination of text and interaction
/// is needed.
class ListTileButton extends StatelessWidget {
  /// Creates a `ListTileButton` with the specified parameters.
  const ListTileButton({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.leading,
  });

  /// The primary content of the `ListTileButton`.
  final Widget title;

  /// An optional secondary content of the `ListTileButton`.
  final Widget? subtitle;

  /// An optional leading widget displayed at the beginning of the `ListTileButton`.
  final Widget? leading;

  /// A callback function that is invoked when the `ListTileButton` is tapped.
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
            color: Colors.amber,
          ),
        ),
        leading: leading,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: title,
        ),
        subtitle: subtitle,
        onTap: onTap,
      ),
    );
  }
}
