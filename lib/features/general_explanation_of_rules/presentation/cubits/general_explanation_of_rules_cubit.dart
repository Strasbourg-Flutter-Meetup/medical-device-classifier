// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016133631
// 16.10.2023 13:36
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/content_files/content_loader.dart';
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';
import 'package:medical_device_classifier/extensions/cubit_extension.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_state.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';
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
  ///
  /// The [contentLoader] parameter is responsible for loading content, including LeoML documents.
  GeneralExplanationOfRulesCubit(
    super.initialState, {
    required this.leoMLDocumentParser,
    required this.sharedPreferencesRepository,
    required this.expansionTile1Template,
    required this.contentLoader,
    required this.globalEventBus,
  });

  /// An instance of the LeoML document parser used for parsing LeoML documents.
  final LeoMLDocumentParser leoMLDocumentParser;

  /// A repository for managing shared preferences data.
  final SharedPreferencesRepository sharedPreferencesRepository;

  /// A template for creating ExpansionTile widgets.
  final ExpansionTile1 expansionTile1Template;

  /// The content loader responsible for loading necessary content, including LeoML documents.
  final ContentLoader contentLoader;

  /// A global event bus instance for handling cross-component communication.
  ///
  /// The `globalEventBus` is used to publish and subscribe to global events
  /// within the application. Components can use it to communicate and trigger
  /// actions across different parts of the app.
  final GlobalEventBus globalEventBus;

  /// The data representing the current state of the general explanations of rules.
  GeneralExplanationOfRulesStateData? _stateData;

  /// A widget representing a column of expansion tiles.
  Widget _columnOfExpansionTiles = const Placeholder();

  /// A subscription to the global event bus stream.
  ///
  /// The [_globalEventBusStreamSubscription] is used to listen to events
  /// published on the global event bus. It allows components to react to
  /// and handle global events by subscribing to the event bus stream.
  StreamSubscription<dynamic>? _globalEventBusStreamSubscription;


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
      await dataSourcesConnectionReinitialization(
        sharedPreferencesRepository: sharedPreferencesRepository,
        supabaseClient:
            contentLoader.storageDownloadRepository.supabaseClientImpl,
      );
      await contentLoader.load(
        contentLoaderType: ContentLoaderType.generalExplanationRules,
      );
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

  /// Cancels the subscription to the global event bus stream.
  ///
  /// This method cancels the subscription to the global event bus stream,
  /// preventing further event listening. It should be called when the component
  /// using the global event bus is disposed.
  Future<void> cancelGlobalEventBusSubscription() async {
    await _globalEventBusStreamSubscription?.cancel();
  }

  /// Listens to global events and performs actions based on received events.
  ///
  /// This method sets up a stream subscription to the global event bus and listens
  /// for specific events such as language switches (German, English, French). When
  /// an event is received, it triggers actions like reloading content from shared
  /// preferences and updating the state of the component accordingly.
  void listenToGlobalEventBus() {
    _globalEventBusStreamSubscription = globalEventBus.eventBus
        .where(
          (event) =>
      event == GlobalEvent.switchToGerman ||
          event == GlobalEvent.switchToEnglish ||
          event == GlobalEvent.switchToFrench,
    )
        .listen((event) async {
      try {
        emit(const GeneralExplanationOfRulesState.loading());

        await contentLoader.load(
          contentLoaderType: ContentLoaderType.generalExplanationRules,
        );
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
        emit(const GeneralExplanationOfRulesState.error());
      }
    });
  }


  /// Updates the [_stateData] with the current [_columnOfExpansionTiles].
  void _updateStateData() {
    _stateData = GeneralExplanationOfRulesStateData(
      column: _columnOfExpansionTiles,
    );
  }
}
