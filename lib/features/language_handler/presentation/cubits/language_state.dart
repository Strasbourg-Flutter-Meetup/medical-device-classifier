// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231111181639
// 11.11.2023 18:16

import 'package:equatable/equatable.dart';
import 'package:medical_device_classifier/state_management/states.dart';

/// The `LanguageStateData` class represents the specific data associated with the [LanguageState].
class LanguageStateData extends Equatable {
  /// Creates a [LanguageStateData] instance with the provided [languageCode].
  const LanguageStateData({required this.languageCode});

  /// The language code representing the current application language.
  final String languageCode;

  @override
  List<Object?> get props => [languageCode];

  /// Creates a copy of the [LanguageStateData] object with an optional [languageCode].
  ///
  /// This method is used for creating a new instance of [LanguageStateData] with the same properties.
  LanguageStateData copyWith({String? languageCode}) =>
      LanguageStateData(languageCode: languageCode ?? this.languageCode);
}

/// A typedef representing the state template for language-related state management.
///
/// The [LanguageState] is a generic state template that holds [LanguageStateData] as its data.
typedef LanguageState = StateTemplate<LanguageStateData>;
