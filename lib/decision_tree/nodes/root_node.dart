// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231027165255
// 27.10.2023 16:52
import 'package:medical_device_classifier/decision_tree/nodes/interfaces/decision_node.dart';

/// A class representing the root node of a decision tree.
class RootNode extends DecisionNode {
  /// Creates a [RootNode] with the specified attributes.
  ///
  /// - [id]: A unique identifier for this node.
  /// - [decision]: The decision associated with this node.
  /// - [options]: A map of options leading to child nodes.
  RootNode({
    required super.id,
    required super.decision,
    required super.options,
  });
}
