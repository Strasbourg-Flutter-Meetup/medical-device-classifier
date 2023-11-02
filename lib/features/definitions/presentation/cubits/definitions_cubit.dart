// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231102185707
// 02.11.2023 18:57
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/extensions/cubit_extension.dart';
import 'package:medical_device_classifier/features/definitions/presentation/cubits/definitions_state.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

class DefinitionsCubit extends Cubit<DefinitionsState> {
  DefinitionsCubit(
    super.initialState, {
    required this.leoMLDocumentParser,
    required this.sharedPreferencesRepository,
    required this.expansionTile1Template,
  });

  DefinitionsStateData? _stateData;

  final LeoMLDocumentParser leoMLDocumentParser;

  final SharedPreferencesRepository sharedPreferencesRepository;

  final ExpansionTile1 expansionTile1Template;

  Widget _columnOfExpansionTiles = const Placeholder();

  Future<void> initialize() async {
    emit(const DefinitionsState.loading());
    await sharedPreferencesReinitialization(sharedPreferencesRepository);
    final leoMLDocument = sharedPreferencesRepository.read(
      key: SharedPreferencesKeys.definitions,
    );

    _columnOfExpansionTiles = await leoMLDocumentParser.parseToColumn(
      leoMLDocument: leoMLDocument,
      template: expansionTile1Template,
    );

    _updateStateData();

    emit(DefinitionsState.loaded(data: _stateData));
  }

  void _updateStateData() {
    _stateData = DefinitionsStateData(
      column: _columnOfExpansionTiles,
    );
  }
}
