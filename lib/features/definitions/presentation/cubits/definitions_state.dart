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

class DefinitionsStateData extends Equatable {
  const DefinitionsStateData({required this.column});

  final Widget column;

  @override
  List<Object?> get props => [column];
}

typedef DefinitionsState = StateTemplate<DefinitionsStateData>;
