// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231027165235
// 27.10.2023 16:52


/// An abstract class representing a node in a decision tree.
abstract class Node {
  /// Creates a [Node] with the specified unique identifier.
  ///
  /// - [id]: A unique identifier for this node.
  Node({
    required this.id,
  });

  /// A unique identifier for this node.
  final String id;
}




