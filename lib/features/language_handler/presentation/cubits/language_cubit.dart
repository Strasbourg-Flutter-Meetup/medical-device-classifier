// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231111181621
// 11.11.2023 18:16
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/features/language_handler/presentation/cubits/language_state.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';

/// The `LanguageCubit` class is responsible for managing language-related state in the Medical Device Classifier application.
///
/// It extends [Cubit] and listens to global language change events through the [GlobalEventBus].
class LanguageCubit extends Cubit<LanguageState> {
  /// Creates a [LanguageCubit] instance.
  ///
  /// The [globalEventBus] parameter is required to listen to global language change events.
  LanguageCubit(super.initialState, {required this.globalEventBus});

  /// The [GlobalEventBus] instance used for listening to language change events.
  final GlobalEventBus globalEventBus;

  /// Stores the language-related state data.
  LanguageStateData? _stateData;

  /// Represents the current language code.
  String _languageCode = '';

  /// A subscription to the global event bus stream for language change events.
  StreamSubscription<dynamic>? _globalEventBusSubscription;

  Future<void> cancelGlobalEventBusSubscription() async {
    await _globalEventBusSubscription?.cancel();
  }

  /// Listens to global language change events and updates the language-related state.
  void listenToGlobalEventBus() {
    _globalEventBusSubscription = globalEventBus.eventBus
        .where(
      (event) =>
          event == GlobalEvent.switchToEnglish ||
          event == GlobalEvent.switchToFrench ||
          event == GlobalEvent.switchToGerman,
    )
        .listen((event) {
      emit(const LanguageState.loading());

      // Determine the language code based on the received event.
      switch (event) {
        case GlobalEvent.switchToFrench:
          _languageCode = 'fr';
          break;
        case GlobalEvent.switchToGerman:
          _languageCode = 'de';
          break;
        default:
          _languageCode = 'en';
      }

      // Update the language-related state data.
      _updateStateData();
      emit(LanguageState.loaded(data: _stateData));
    });
  }

  /// Updates the state data with the current language code.
  void _updateStateData() {
    _stateData = LanguageStateData(languageCode: _languageCode);
  }
}
