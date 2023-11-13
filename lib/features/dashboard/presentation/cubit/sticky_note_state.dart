// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231111211013
// 11.11.2023 21:10
import 'package:equatable/equatable.dart';
import 'package:medical_device_classifier/state_management/states.dart';

/// The [StickyNoteStateData] class represents the specific data associated with the [StickyNoteState].
/// It extends [Equatable], allowing for easy comparison and equality checks.
class StickyNoteStateData extends Equatable {
  const StickyNoteStateData({required this.showStickyNote});

  /// Indicates whether the sticky note should be displayed.
  final bool showStickyNote;

  @override
  List<Object?> get props => [showStickyNote];
}

/// A typedef for [StateTemplate] with [StickyNoteStateData].
typedef StickyNoteState = StateTemplate<StickyNoteStateData>;
