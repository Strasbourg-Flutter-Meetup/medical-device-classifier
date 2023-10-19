// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016132502
// 16.10.2023 13:25
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_device_classifier/state_management/states.dart';

class GeneralExplanationOfRulesStateData extends Equatable {
  const GeneralExplanationOfRulesStateData({required this.column});

  final Widget column;

  @override
  List<Object?> get props => [column];

  GeneralExplanationOfRulesStateData copyWith({Widget? column}) =>
      GeneralExplanationOfRulesStateData(
        column: column ?? this.column,
      );
}

typedef GeneralExplanationOfRulesState
    = StateTemplate<GeneralExplanationOfRulesStateData>;
