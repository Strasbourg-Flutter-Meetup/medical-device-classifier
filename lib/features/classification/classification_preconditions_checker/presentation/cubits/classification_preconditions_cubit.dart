// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024144106
// 24.10.2023 14:41
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/features/classification/classification_preconditions_checker/presentation/cubits/classification_precondition_state.dart';

/// A [Cubit] responsible for managing the state of the classification preconditions screen.
///
/// The [ClassificationPreconditionsCubit] class handles the state management for the
/// classification preconditions screen, including whether the product is medical, whether
/// the user knows about definitions, and whether the user knows about implementing rules.
///
/// Example:
///
/// ```dart
/// final cubit = ClassificationPreconditionsCubit(ClassificationPreconditionsState.initial());
/// cubit.initialize();
/// ```
class ClassificationPreconditionsCubit
    extends Cubit<ClassificationPreconditionsState> {
  /// Creates an instance of [ClassificationPreconditionsCubit] with an initial state.
  ///
  /// The constructor takes an initial state and initializes the cubit with it.
  ClassificationPreconditionsCubit(super.initialState);

  ClassificationPreconditionsStateData? _stateData;

  bool _isMedicalProduct = false;
  bool _knowsAboutDefinitions = false;
  bool _knowsAboutImplementingRules = false;

  /// Initializes the cubit's state.
  ///
  /// The [initialize] method sets the initial state to loading, updates the state data,
  /// and then emits a loaded state with the updated data.
  ///
  /// Example:
  ///
  /// ```dart
  /// cubit.initialize();
  /// ```
  void initialize() {
    emit(const ClassificationPreconditionsState.loading());
    _updateStateData();
    emit(
      ClassificationPreconditionsState.loaded(
        data: _stateData,
      ),
    );
  }

  /// Updates the "Is Medical Product" property.
  ///
  /// The [updateIsMedicalProduct] method updates the value of [_isMedicalProduct],
  /// triggers an update of the state data, and emits a loaded state with the updated data.
  ///
  /// Example:
  ///
  /// ```dart
  /// cubit.updateIsMedicalProduct(isMedicalProduct: true);
  /// ```
  void updateIsMedicalProduct({required bool isMedicalProduct}) {
    emit(const ClassificationPreconditionsState.loading());
    _isMedicalProduct = isMedicalProduct;
    _updateStateData();
    emit(
      ClassificationPreconditionsState.loaded(
        data: _stateData,
      ),
    );
  }

  /// Updates the "Knows About Definitions" property.
  ///
  /// The [updateKnowsAboutDefinitions] method updates the value of [_knowsAboutDefinitions],
  /// triggers an update of the state data, and emits a loaded state with the updated data.
  ///
  /// Example:
  ///
  /// ```dart
  /// cubit.updateKnowsAboutDefinitions(knowsAboutDefinitions: true);
  /// ```
  void updateKnowsAboutDefinitions({required bool knowsAboutDefinitions}) {
    emit(const ClassificationPreconditionsState.loading());
    _knowsAboutDefinitions = knowsAboutDefinitions;
    _updateStateData();
    emit(
      ClassificationPreconditionsState.loaded(
        data: _stateData,
      ),
    );
  }

  /// Updates the "Knows About Implementing Rules" property.
  ///
  /// The [updateKnowsAboutImplementingRules] method updates the value of
  /// [_knowsAboutImplementingRules], triggers an update of the state data, and emits a
  /// loaded state with the updated data.
  ///
  /// Example:
  ///
  /// ```dart
  /// cubit.updateKnowsAboutImplementingRules(knowsAboutImplementingRules: true);
  /// ```
  void updateKnowsAboutImplementingRules({
    required bool knowsAboutImplementingRules,
  }) {
    emit(const ClassificationPreconditionsState.loading());
    _knowsAboutImplementingRules = knowsAboutImplementingRules;
    _updateStateData();
    emit(
      ClassificationPreconditionsState.loaded(
        data: _stateData,
      ),
    );
  }

  /// Updates the state data based on property values.
  ///
  /// The [_updateStateData] method recalculates the state data based on the values of
  /// [_isMedicalProduct], [_knowsAboutDefinitions], and [_knowsAboutImplementingRules].
  void _updateStateData() {
    _stateData = ClassificationPreconditionsStateData(
      isMedicalProduct: _isMedicalProduct,
      knowsAboutDefinitions: _knowsAboutDefinitions,
      knowsAboutImplementingRules: _knowsAboutImplementingRules,
      continueButtonIsActive: _isMedicalProduct &&
          _knowsAboutDefinitions &&
          _knowsAboutImplementingRules,
    );
  }
}
