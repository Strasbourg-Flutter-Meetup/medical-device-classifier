// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231112095648
// 12.11.2023 09:56
import 'package:equatable/equatable.dart';
import 'package:medical_device_classifier/state_management/states.dart';
/// The [AppBarStateData] class represents the specific data associated with the [AppBarState].
///
/// It extends [Equatable], allowing for easy comparison and equality checks.
class AppBarStateData extends Equatable {
  @override
  List<Object?> get props => [];
}

/// A typedef for [AppBarState] using [StateTemplate] with [AppBarStateData].
typedef AppBarState = StateTemplate<AppBarStateData>;
