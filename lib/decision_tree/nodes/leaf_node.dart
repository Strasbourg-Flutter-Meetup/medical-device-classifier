// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231027165311
// 27.10.2023 16:53

import 'package:medical_device_classifier/decision_tree/nodes/interfaces/node.dart';

/// A class representing a leaf node in a decision tree.
class LeafNode extends Node {
  /// Creates a [LeafNode] with the specified attributes.
  ///
  /// - [id]: A unique identifier for this node.
  /// - [result]: The result or classification associated with this leaf node.
  LeafNode({
    required super.id,
    required this.result,
  });

  /// The result or classification associated with this leaf node.
  final String result;
}

