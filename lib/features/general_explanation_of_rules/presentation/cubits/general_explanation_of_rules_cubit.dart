// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016133631
// 16.10.2023 13:36
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/extensions/cubit_extension.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_state.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// A Cubit responsible for managing the state and logic related to the
/// general explanation of rules in the application.
///
/// The [GeneralExplanationOfRulesCubit] extends [Cubit] and handles the state
/// and logic for displaying a column of expansion tiles that explain rules.
class GeneralExplanationOfRulesCubit
    extends Cubit<GeneralExplanationOfRulesState> {
  /// Constructs a [GeneralExplanationOfRulesCubit] with the required dependencies.
  ///
  /// The [leoMLDocumentParser] parameter is responsible for parsing LeoML documents.
  ///
  /// The [sharedPreferencesRepository] parameter manages shared preferences data.
  ///
  /// The [expansionTile1Template] parameter represents a template for expansion tiles.
  GeneralExplanationOfRulesCubit(
    super.initialState, {
    required this.leoMLDocumentParser,
    required this.sharedPreferencesRepository,
    required this.expansionTile1Template,
  });

  /// An instance of the LeoML document parser used for parsing LeoML documents.
  final LeoMLDocumentParser leoMLDocumentParser;

  /// A repository for managing shared preferences data.
  final SharedPreferencesRepository sharedPreferencesRepository;

  /// A template for creating ExpansionTile widgets.
  final ExpansionTile1 expansionTile1Template;

  GeneralExplanationOfRulesStateData? _stateData;

  /// A widget representing a column of expansion tiles.
  Widget _columnOfExpansionTiles = const Placeholder();

  /// Initializes the cubit by loading LeoML documents and updating the state.
  ///
  /// This method emits a loading state initially, reads LeoML documents from
  /// shared preferences, parses them into a column of expansion tiles using
  /// the provided template, and updates the state accordingly.
  ///
  /// If an error occurs during initialization, it emits a
  /// [GeneralExplanationOfRulesState.error] state.
  Future<void> initialize() async {
    try {
      emit(const GeneralExplanationOfRulesState.loading());
      await sharedPreferencesReinitialization(sharedPreferencesRepository);
      final leoMLDocument = sharedPreferencesRepository.read(
        key: SharedPreferencesKeys.rules,
      );

      _columnOfExpansionTiles = await leoMLDocumentParser.parseToColumn(
        leoMLDocument: leoMLDocument,
        template: expansionTile1Template,
      );

      _updateStateData();

      emit(GeneralExplanationOfRulesState.loaded(data: _stateData));
    } catch (e) {
      emit(
        const GeneralExplanationOfRulesState.error(),
      );
    }
  }


  /// Updates the [_stateData] with the current [_columnOfExpansionTiles].
  void _updateStateData() {
    _stateData = GeneralExplanationOfRulesStateData(
      column: _columnOfExpansionTiles,
    );
  }
}
