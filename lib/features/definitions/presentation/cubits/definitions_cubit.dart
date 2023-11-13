// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231102185707
// 02.11.2023 18:57
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/content_files/content_loader.dart';
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';
import 'package:medical_device_classifier/extensions/cubit_extension.dart';
import 'package:medical_device_classifier/features/definitions/presentation/cubits/definitions_state.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// A Cubit for managing the state of definitions content.
///
/// The [DefinitionsCubit] handles the state management for the definitions content.
/// It provides methods to initialize and update the state based on data loaded from
/// various sources such as shared preferences and external storage.
class DefinitionsCubit extends Cubit<DefinitionsState> {
  /// Creates an instance of [DefinitionsCubit] with the required dependencies.
  ///
  /// - [leoMLDocumentParser]: The parser responsible for converting a LeoML document into a structured format.
  /// - [sharedPreferencesRepository]: The repository that provides an interface for reading and writing shared preferences.
  /// - [expansionTile1Template]: The template that guides the structure and layout of an expansion tile.
  /// - [contentLoader]: The content loader responsible for loading definitions content.
  DefinitionsCubit(
    super.initialState, {
    required this.leoMLDocumentParser,
    required this.sharedPreferencesRepository,
    required this.expansionTile1Template,
    required this.contentLoader,
    required this.globalEventBus,
  });

  /// The parser responsible for converting a LeoML document into a structured format.
  final LeoMLDocumentParser leoMLDocumentParser;

  /// The repository that provides an interface for reading and writing shared preferences.
  final SharedPreferencesRepository sharedPreferencesRepository;

  /// The template that guides the structure and layout of an expansion tile.
  final ExpansionTile1 expansionTile1Template;

  /// The content loader responsible for loading definitions content.
  final ContentLoader contentLoader;

  /// The parsed state data.
  DefinitionsStateData? _stateData;

  /// A global event bus instance for handling cross-component communication.
  ///
  /// The `globalEventBus` is used to publish and subscribe to global events
  /// within the application. Components can use it to communicate and trigger
  /// actions across different parts of the app.
  final GlobalEventBus globalEventBus;


  /// The visual representation of definitions, structured as a column of expansion tiles.
  Widget _columnOfExpansionTiles = const Placeholder();

  /// A subscription to the global event bus stream.
  ///
  /// The [_globalEventBusStreamSubscription] is used to listen to events
  /// published on the global event bus. It allows components to react to
  /// and handle global events by subscribing to the event bus stream.
  StreamSubscription<dynamic>? _globalEventBusStreamSubscription;


  /// Initializes the cubit by loading definitions content and updating the state.
  ///
  /// This method emits a loading state initially, reinitializes data sources connection,
  /// reads definitions content from shared preferences, parses it into a column of
  /// expansion tiles using the provided template, and updates the state accordingly.
  ///
  /// If an error occurs during initialization, it emits a [DefinitionsState.error] state.
  Future<void> initialize() async {
    try {
      emit(const DefinitionsState.loading());

      // Reinitialize data sources connection.
      await dataSourcesConnectionReinitialization(
        sharedPreferencesRepository: sharedPreferencesRepository,
        supabaseClient:
            contentLoader.storageDownloadRepository.supabaseClientImpl,
      );

      await contentLoader.load(
        contentLoaderType: ContentLoaderType.definitions,
      );

      final leoMLDocument = sharedPreferencesRepository.read(
        key: SharedPreferencesKeys.definitions,
      );

      _columnOfExpansionTiles = await leoMLDocumentParser.parseToColumn(
        leoMLDocument: leoMLDocument,
        template: expansionTile1Template,
      );

      _updateStateData();

      emit(DefinitionsState.loaded(data: _stateData));
    } catch (e) {
      emit(
        const DefinitionsState.error(),
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
        emit(const DefinitionsState.loading());

        await contentLoader.load(
          contentLoaderType: ContentLoaderType.definitions,
        );
        final leoMLDocument = sharedPreferencesRepository.read(
          key: SharedPreferencesKeys.definitions,
        );

        _columnOfExpansionTiles = await leoMLDocumentParser.parseToColumn(
          leoMLDocument: leoMLDocument,
          template: expansionTile1Template,
        );

        _updateStateData();

        emit(DefinitionsState.loaded(data: _stateData));
      } catch (e) {
        emit(const DefinitionsState.error());
      }
    });
  }


  /// Updates the state data.
  ///
  /// This private method is used to update the [_stateData] with the current column
  /// of expansion tiles.
  void _updateStateData() {
    _stateData = DefinitionsStateData(
      column: _columnOfExpansionTiles,
    );
  }
}
