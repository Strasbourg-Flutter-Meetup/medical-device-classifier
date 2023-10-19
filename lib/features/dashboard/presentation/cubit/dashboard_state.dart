// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011210518
// 11.10.2023 21:05
import 'package:equatable/equatable.dart';
import 'package:medical_device_classifier/state_management/states.dart';

/// The [DashboardStateData] class represents the specific data associated with the [DashboardState].
/// It extends [Equatable], allowing for easy comparison and equality checks.
class DashboardStateData extends Equatable {
  const DashboardStateData();

  @override
  List<Object?> get props => [];

  /// Creates a copy of the [DashboardStateData] object.
  ///
  /// This method is used for creating a new instance of [DashboardStateData] with the same properties.
  DashboardStateData copyWith() => const DashboardStateData();
}

/// The [DashboardState] type is an alias for a specific state template.
///
/// It uses the [StateTemplate] class with [DashboardStateData] as its associated data type.
/// This allows the [DashboardState] to represent various states with [DashboardStateData] as their specific data.
typedef DashboardState = StateTemplate<DashboardStateData>;
