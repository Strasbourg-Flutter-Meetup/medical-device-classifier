// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231111211144
// 11.11.2023 21:11
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/sticky_note_state.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';
import 'package:medical_device_classifier/routing/go_router_context.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// The [StickyNoteCubit] class manages the state and behavior of the sticky note widget.
class StickyNoteCubit extends Cubit<StickyNoteState> {
  /// Creates a [StickyNoteCubit] with the required dependencies.
  ///
  /// - [sharedPreferencesRepository]: The repository for managing shared preferences data.
  /// - [globalEventBus]: The global event bus for handling application-level events.
  StickyNoteCubit(
      super.initialState, {
        required this.sharedPreferencesRepository,
        required this.globalEventBus,
      });

  final SharedPreferencesRepository sharedPreferencesRepository;
  final GlobalEventBus globalEventBus;

  bool _showStickyNoteTranslationNote = false;
  StickyNoteStateData? _stateData;
  StreamSubscription<dynamic>? globalEventBusStreamSubscription;

  /// Initializes the [StickyNoteCubit].
  ///
  /// This method initializes the [StickyNoteCubit] by listening to global events and determining whether to show the translation note.
  /// It also sets the initial state to [loading] and updates it when necessary.
  void initialize() {
    emit(const StickyNoteState.loading());
    _listenToGlobalEventBus();

    final appLanguage = sharedPreferencesRepository.read(
      key: SharedPreferencesKeys.appLanguage,
    );

    if (appLanguage.isEmpty &&
        Localizations.localeOf(goRouterContext!).languageCode != 'en' ||
        appLanguage.isNotEmpty && appLanguage != 'en') {
      _showStickyNoteTranslationNote = true;
    }

    if (appLanguage.isNotEmpty) {
      GlobalEvent event = GlobalEvent.switchToEnglish;

      switch (appLanguage) {
        case 'de':
          event = GlobalEvent.switchToGerman;
          break;
        case 'fr':
          event = GlobalEvent.switchToFrench;
          break;
        default:
          event = GlobalEvent.switchToEnglish;
      }

      globalEventBus.addEvent(event);
    }

    _updateStateData();
    emit(StickyNoteState.loaded(data: _stateData));
  }

  /// Cancels the subscription to the global event bus stream.
  Future<void> cancelGlobalEventBusStreamSubscription() async {
    await globalEventBusStreamSubscription?.cancel();
  }

  /// Listens to global events and updates the sticky note state accordingly.
  void _listenToGlobalEventBus() {
    globalEventBusStreamSubscription = globalEventBus.eventBus
        .where(
          (event) =>
      event == GlobalEvent.hideStickyNote ||
          event == GlobalEvent.showStickyNote,
    )
        .listen((event) {
      emit(StickyNoteState.loading(previousData: _stateData));

      switch (event) {
        case GlobalEvent.hideStickyNote:
          _showStickyNoteTranslationNote = false;
          break;
        default:
          _showStickyNoteTranslationNote = true;
      }

      _updateStateData();

      emit(
        StickyNoteState.loaded(
          data: _stateData,
        ),
      );
    });
  }

  /// Updates the [StickyNoteStateData] with the current state of the sticky note.
  void _updateStateData() {
    _stateData = StickyNoteStateData(
      showStickyNote: _showStickyNoteTranslationNote,
    );
  }
}

