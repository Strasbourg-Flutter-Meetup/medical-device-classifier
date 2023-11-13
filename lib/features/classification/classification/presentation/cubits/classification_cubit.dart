// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231029135339
// 29.10.2023 13:53
import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/content_files/content_loader.dart';
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';
import 'package:medical_device_classifier/decision_tree/decision_tree.dart';
import 'package:medical_device_classifier/decision_tree/nodes/interfaces/node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/leaf_node.dart';
import 'package:medical_device_classifier/extensions/cubit_extension.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/cubits/classification_state.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// A Cubit class for managing classification state and navigation within a decision tree.
class ClassificationCubit extends Cubit<ClassificationState> {
  /// Creates a [ClassificationCubit] with the provided initial state, decision tree,
  /// shared preferences repository, and content loader.
  ///
  /// - [initialState]: The initial state of the cubit.
  /// - [decisionTree]: The decision tree used for classification.
  /// - [sharedPreferencesRepository]: The repository for managing shared preferences.
  /// - [contentLoader]: The content loader responsible for loading necessary content.
  ClassificationCubit(
    super.initialState, {
    required this.decisionTree,
    required this.sharedPreferencesRepository,
    required this.contentLoader,
    required this.globalEventBus,
  });

  /// The decision tree used for classification.
  final DecisionTree decisionTree;

  /// The repository for managing shared preferences.
  final SharedPreferencesRepository sharedPreferencesRepository;

  /// The content loader responsible for loading necessary content.
  final ContentLoader contentLoader;

  /// A global event bus instance for handling cross-component communication.
  ///
  /// The `globalEventBus` is used to publish and subscribe to global events
  /// within the application. Components can use it to communicate and trigger
  /// actions across different parts of the app.
  final GlobalEventBus globalEventBus;

  /// The data representing the current state of the classification.
  ClassificationStateData? _stateData;

  /// The current node in the decision tree.
  Node? _currentNode;

  /// A subscription to the global event bus stream.
  ///
  /// The [_globalEventBusStreamSubscription] is used to listen to events
  /// published on the global event bus. It allows components to react to
  /// and handle global events by subscribing to the event bus stream.
  StreamSubscription<dynamic>? _globalEventBusStreamSubscription;


  /// Initializes the cubit by loading the decision tree and setting the initial state.
  ///
  /// This method initializes the [ClassificationCubit] by using the provided [contentLoader]
  /// to load the decision tree and setting the initial state to [ClassificationState.loading].
  /// If an error occurs during initialization, it emits an [ClassificationState.error] state.
  ///
  /// Throws an error if loading or initialization fails.
  Future<void> initialize() async {
    try {
      emit(const ClassificationState.loading());
      await dataSourcesConnectionReinitialization(
        sharedPreferencesRepository: sharedPreferencesRepository,
        supabaseClient:
            contentLoader.storageDownloadRepository.supabaseClientImpl,
      );
      await contentLoader.load(
        contentLoaderType: ContentLoaderType.decisionTree,
      );
      final jsonString = sharedPreferencesRepository.read(
        key: SharedPreferencesKeys.decisionTree,
      );

      final decisionTreeMap = jsonDecode(jsonString) as List;

      decisionTree.initialize(decisionTree: decisionTreeMap.cast());
      _currentNode = decisionTree.getRootNodes().first;
      decisionTree.addNodeToHistory(
        node: _currentNode ??
            LeafNode(
              id: '',
              result: '',
            ),
      );
      _updateStateData();

      emit(
        ClassificationState.loaded(
          data: _stateData,
        ),
      );
    } catch (error) {
      // Emit an error state to handle the error gracefully.
      emit(
        const ClassificationState.error(),
      );
    }
  }

  /// Navigates forward in the decision tree to the node with the specified [id].
  ///
  /// This method advances the classification process by navigating to the node
  /// with the specified [id] in the decision tree. If an error occurs during
  /// navigation, it emits an [error] state.
  void goForward({required String id}) {
    try {
      emit(const ClassificationState.loading());
      _currentNode = decisionTree.getNode(id: id);
      decisionTree.addNodeToHistory(
        node: _currentNode ??
            LeafNode(
              id: '',
              result: '',
            ),
      );
      _updateStateData();
      emit(
        ClassificationState.loaded(
          data: _stateData,
        ),
      );
    } catch (e) {
      emit(
        const ClassificationState.error(),
      );
    }
  }

  /// Navigates backward in the decision tree.
  ///
  /// This method allows the user to go back in the classification process by
  /// navigating to the previous node in the decision tree. If an error occurs
  /// during navigation, it emits an [error] state.
  void goBack() {
    try {
      emit(const ClassificationState.loading());
      decisionTree.removeLastNodeFromHistory();
      _currentNode = decisionTree.getLastNode();
      _updateStateData();
      emit(
        ClassificationState.loaded(
          data: _stateData,
        ),
      );
    } catch (e) {
      emit(
        const ClassificationState.error(),
      );
    }
  }

  /// Restarts the classification process by resetting to the initial state of the decision tree.
  ///
  /// This method restarts the classification process by resetting the decision
  /// tree to its initial state. If an error occurs during the restart, it emits
  /// an [error] state.
  void restart() {
    try {
      emit(const ClassificationState.loading());
      _currentNode = decisionTree.restart();
      _updateStateData();
      emit(
        ClassificationState.loaded(
          data: _stateData,
        ),
      );
    } catch (e) {
      emit(
        const ClassificationState.error(),
      );
    }
  }

  /// Cancels the subscription to the global event bus stream.
  ///
  /// This method cancels the subscription to the global event bus stream, which
  /// is used to listen for language change events. It ensures that the subscription
  /// is properly disposed of to prevent memory leaks.
  Future<void> cancelGlobalEventBusSubscription() async {
    await _globalEventBusStreamSubscription?.cancel();
  }

  /// Listens to the global event bus for language change events.
  ///
  /// This method subscribes to the global event bus stream and listens for
  /// language change events, including switching to German, English, or French.
  /// When a language change event occurs, it reloads the decision tree content
  /// based on the selected language and updates the cubit's state accordingly.
  /// If an error occurs during content loading, it emits an error state.
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
        emit(const ClassificationState.loading());

        await contentLoader.load(
          contentLoaderType: ContentLoaderType.decisionTree,
        );

        final jsonString = sharedPreferencesRepository.read(
          key: SharedPreferencesKeys.decisionTree,
        );

        final decisionTreeMap = jsonDecode(jsonString) as List;
        decisionTree.clearTree();
        decisionTree.initialize(decisionTree: decisionTreeMap.cast());

        _currentNode = decisionTree.getRootNodes().first;
        decisionTree.addNodeToHistory(
          node: _currentNode ??
              LeafNode(
                id: '',
                result: '',
              ),
        );

        _updateStateData();

        emit(ClassificationState.loaded(data: _stateData));
      } catch (e) {
        emit(const ClassificationState.error());
      }
    });
  }


  /// Updates the internal state based on the current node.
  void _updateStateData() {
    _stateData = ClassificationStateData(
      currentNode: _currentNode ??
          LeafNode(
            id: '',
            result: '',
          ),
    );
  }
}
