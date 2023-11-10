// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024143221
// 24.10.2023 14:32
import 'package:equatable/equatable.dart';
import 'package:medical_device_classifier/state_management/states.dart';

/// Represents the state data for the classification preconditions screen.
///
/// The [ClassificationPreconditionsStateData] class encapsulates the state data
/// for the classification preconditions screen, including whether the product
/// is medical, whether the user knows about definitions, and whether the user
/// knows about implementing rules. It also indicates whether the "Continue"
/// button is active.
///
/// Example:
///
/// ```dart
/// final stateData = ClassificationPreconditionsStateData(
///   isMedicalProduct: true,
///   knowsAboutDefinitions: true,
///   knowsAboutImplementingRules: false,
///   continueButtonIsActive: true,
/// );
/// ```
class ClassificationPreconditionsStateData extends Equatable {
  /// Creates an instance of [ClassificationPreconditionsStateData].
  ///
  /// The constructor requires values for whether the product is medical
  /// ([isMedicalProduct]), whether the user knows about definitions
  /// ([knowsAboutDefinitions]), whether the user knows about implementing rules
  /// ([knowsAboutImplementingRules]), and whether the "Continue" button is active
  /// ([continueButtonIsActive]).
  const ClassificationPreconditionsStateData({
    required this.isMedicalProduct,
    required this.knowsAboutDefinitions,
    required this.knowsAboutImplementingRules,
    required this.continueButtonIsActive,
  });

  /// Indicates whether the product is medical.
  final bool isMedicalProduct;

  /// Indicates whether the user knows about definitions.
  final bool knowsAboutDefinitions;

  /// Indicates whether the user knows about implementing rules.
  final bool knowsAboutImplementingRules;

  /// Indicates whether the "Continue" button is active.
  final bool continueButtonIsActive;

  @override
  List<Object?> get props => [
    isMedicalProduct,
    knowsAboutDefinitions,
    knowsAboutImplementingRules,
  ];

  /// Creates a copy of [ClassificationPreconditionsStateData] with optional
  /// property updates.
  ///
  /// This method allows creating a new instance of [ClassificationPreconditionsStateData]
  /// with updated property values. Specify the properties to update, and the
  /// remaining properties will be copied from the current instance.
  ///
  /// Example:
  ///
  /// ```dart
  /// final newStateData = currentStateData.copyWith(
  ///   isMedicalProduct: true,
  ///   continueButtonIsActive: false,
  /// );
  /// ```
  ClassificationPreconditionsStateData copyWith({
    bool? isMedicalProduct,
    bool? knowsAboutDefinitions,
    bool? knowsAboutImplementingRules,
    bool? continueButtonIsActive,
  }) =>
      ClassificationPreconditionsStateData(
        isMedicalProduct: isMedicalProduct ?? this.isMedicalProduct,
        knowsAboutDefinitions:
        knowsAboutDefinitions ?? this.knowsAboutDefinitions,
        knowsAboutImplementingRules:
        knowsAboutImplementingRules ?? this.knowsAboutImplementingRules,
        continueButtonIsActive:
        continueButtonIsActive ?? this.continueButtonIsActive,
      );
}

/// Represents the state template for classification preconditions.
///
/// The [ClassificationPreconditionsState] type is a specialized [StateTemplate]
/// with the [ClassificationPreconditionsStateData] state data type.
///
/// Example:
///
/// ```dart
/// final initialState = ClassificationPreconditionsState.initial();
/// ```
typedef ClassificationPreconditionsState
= StateTemplate<ClassificationPreconditionsStateData>;

