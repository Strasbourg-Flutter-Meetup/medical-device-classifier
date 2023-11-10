// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231029135339
// 29.10.2023 13:53
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/decision_tree/decision_tree.dart';
import 'package:medical_device_classifier/decision_tree/nodes/interfaces/node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/leaf_node.dart';
import 'package:medical_device_classifier/extensions/cubit_extension.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/cubits/classification_state.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// A Cubit class for managing classification state and navigation within a decision tree.
class ClassificationCubit extends Cubit<ClassificationState> {
  /// Creates a [ClassificationCubit] with the provided initial state, decision tree,
  /// and shared preferences repository.
  ///
  /// - [initialState]: The initial state of the cubit.
  /// - [decisionTree]: The decision tree used for classification.
  /// - [sharedPreferencesRepository]: The repository for managing shared preferences.
  ClassificationCubit(
    super.initialState, {
    required this.decisionTree,
    required this.sharedPreferencesRepository,
  });

  final DecisionTree decisionTree;
  final SharedPreferencesRepository sharedPreferencesRepository;
  ClassificationStateData? _classificationStateData;
  Node? _currentNode;

  /// Initializes the cubit by loading the decision tree and setting the initial state.
  ///
  /// This method initializes the [ClassificationCubit] by loading the decision
  /// tree from shared preferences and setting the initial state to [loading].
  /// If an error occurs during initialization, it emits an [error] state.
  Future<void> initialize() async {
    try {
      emit(const ClassificationState.loading());
      await sharedPreferencesReinitialization(sharedPreferencesRepository);
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
      _updateState();

      emit(
        ClassificationState.loaded(
          data: _classificationStateData,
        ),
      );
    } catch (e) {
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
      _updateState();
      emit(
        ClassificationState.loaded(
          data: _classificationStateData,
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
      _updateState();
      emit(
        ClassificationState.loaded(
          data: _classificationStateData,
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
      _updateState();
      emit(
        ClassificationState.loaded(
          data: _classificationStateData,
        ),
      );
    } catch (e) {
      emit(
        const ClassificationState.error(),
      );
    }
  }


  /// Updates the internal state based on the current node.
  void _updateState() {
    _classificationStateData = ClassificationStateData(
      currentNode: _currentNode ??
          LeafNode(
            id: '',
            result: '',
          ),
    );
  }
}
