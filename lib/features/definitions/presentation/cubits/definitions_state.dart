// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231102185010
// 02.11.2023 18:50

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/state_management/states.dart';

/// Represents the data associated with the state of definitions content.
///
/// The [DefinitionsStateData] class holds the data associated with the state of
/// definitions content. It includes a [column] property, which is a visual representation
/// of definitions structured as a column of expansion tiles.
class DefinitionsStateData extends Equatable {
  /// Creates an instance of [DefinitionsStateData] with the provided [column].
  const DefinitionsStateData({required this.column});

  /// A visual representation of definitions structured as a column of expansion tiles.
  final Widget column;

  @override
  List<Object?> get props => [column];
}

/// A type alias for the state of definitions content.
///
/// The [DefinitionsState] type alias represents the state of definitions content and
/// is defined as a [StateTemplate] with [DefinitionsStateData].
typedef DefinitionsState = StateTemplate<DefinitionsStateData>;
