// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231029134551
// 29.10.2023 13:45
import 'package:equatable/equatable.dart';
import 'package:medical_device_classifier/decision_tree/nodes/interfaces/node.dart';
import 'package:medical_device_classifier/state_management/states.dart';

/// Represents the data associated with the classification state.
class ClassificationStateData extends Equatable {
  /// Creates a [ClassificationStateData] with the specified [currentNode].
  const ClassificationStateData({
    required this.currentNode,
  });

  /// The current node in the decision tree.
  final Node currentNode;

  @override
  List<Object?> get props => [currentNode];

  /// Creates a copy of this [ClassificationStateData] with optional changes.
  ClassificationStateData copyWith({Node? currentNode}) =>
      ClassificationStateData(
        currentNode: currentNode ?? this.currentNode,
      );
}

/// A typedef for a classification state using [ClassificationStateData] as the data type.
typedef ClassificationState = StateTemplate<ClassificationStateData>;
