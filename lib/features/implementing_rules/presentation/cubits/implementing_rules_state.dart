// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022135820
// 22.10.2023 13:58
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_device_classifier/state_management/states.dart';

/// Represents the data required for the state of the `ImplementingRulesCubit`.
///
/// This class extends [Equatable] which allows it to override equality comparisons.
/// This is useful in state management to determine when a state changes.
class ImplementingRulesStateData extends Equatable {
  /// Constructs an instance of `ImplementingRulesStateData`.
  ///
  /// The [column] is required to instantiate this data object.
  const ImplementingRulesStateData({required this.column});

  /// Represents a widget which might typically contain the structured view of implementing rules.
  final Widget column;

  @override

  /// A list of properties that the `ImplementingRulesStateData` will use to determine
  /// whether two instances are equal.
  List<Object?> get props => [column];

  /// Returns a new instance of `ImplementingRulesStateData`,
  /// allowing for modifications while preserving immutability.
  ImplementingRulesStateData copyWith({Widget? column}) =>
      ImplementingRulesStateData(
        column: column ?? this.column,
      );
}

/// Represents the state for the `ImplementingRulesCubit`.
///
/// This type uses `StateTemplate` with `ImplementingRulesStateData`
/// as its data structure.
typedef ImplementingRulesState = StateTemplate<ImplementingRulesStateData>;
