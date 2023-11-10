// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231022135918
// 22.10.2023 13:59
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/content_files/content_loader.dart';
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';
import 'package:medical_device_classifier/extensions/cubit_extension.dart';
import 'package:medical_device_classifier/features/implementing_rules/presentation/cubits/implementing_rules_state.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// A [Cubit] responsible for managing and providing state for implementing rules.
///
/// This [Cubit] fetches, parses and provides a structured view of the implementing rules.
/// It utilizes [LeoMLDocumentParser] for parsing documents and [SharedPreferencesRepository]
/// for reading stored preferences.
class ImplementingRulesCubit extends Cubit<ImplementingRulesState> {
  /// Creates an instance of [ImplementingRulesCubit].
  ///
  /// The [leoMLDocumentParser], [sharedPreferencesRepository], [articleTemplate] and [contentLoader]
  /// are required and must not be null.
  ImplementingRulesCubit(
    super.initialState, {
    required this.leoMLDocumentParser,
    required this.sharedPreferencesRepository,
    required this.articleTemplate,
    required this.contentLoader,
  });

  /// The parser responsible for converting a LeoML document into a structured format.
  final LeoMLDocumentParser leoMLDocumentParser;

  /// The repository that provides an interface for reading and writing shared preferences.
  final SharedPreferencesRepository sharedPreferencesRepository;

  /// The template that guides the structure and layout of an article.
  final Article articleTemplate;

  /// The content loader responsible for loading necessary content, including implementing rules.
  final ContentLoader contentLoader;

  /// The parsed state data.
  ImplementingRulesStateData? _stateData;

  /// The visual representation of implementing rules, structured as a column of expansion tiles.
  Widget _columnOfExpansionTiles = const Placeholder();

  /// Initializes the state of the cubit.
  ///
  /// This function fetches the implementing rules document from shared preferences,
  /// parses it, and then updates the cubit's state to reflect the parsed content.
  ///
  /// If an error occurs during initialization, it emits an [ImplementingRulesState.error]
  /// state to handle the error gracefully.
  Future<void> initialize() async {
    try {
      emit(const ImplementingRulesState.loading());
      await contentLoader.load(
        contentLoaderType: ContentLoaderType.implementingRules,
      );
      await sharedPreferencesReinitialization(sharedPreferencesRepository);
      final leoMLDocument = sharedPreferencesRepository.read(
        key: SharedPreferencesKeys.implementingRules,
      );

      _columnOfExpansionTiles = await leoMLDocumentParser.parseToColumn(
        leoMLDocument: leoMLDocument,
        template: articleTemplate,
      );

      _updateStateData();

      emit(ImplementingRulesState.loaded(data: _stateData));
    } catch (error) {
      // Emit an error state to handle the error gracefully.
      emit(
        const ImplementingRulesState.error(),
      );
    }
  }

  /// Updates [_stateData] with the latest parsed content.
  void _updateStateData() {
    _stateData = ImplementingRulesStateData(
      column: _columnOfExpansionTiles,
    );
  }
}
