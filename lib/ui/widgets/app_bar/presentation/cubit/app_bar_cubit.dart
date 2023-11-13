// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231112095756
// 12.11.2023 09:57
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';
import 'package:medical_device_classifier/ui/widgets/app_bar/presentation/cubit/app_bar_state.dart';

/// A Cubit responsible for managing the state of the AppBar.
class AppBarCubit extends Cubit<AppBarState> {
  /// Creates an [AppBarCubit] instance.
  ///
  /// [globalEventBus]: The global event bus for handling events.
  /// [sharedPreferencesRepository]: The repository for managing shared preferences.
  AppBarCubit(
    super.initialState, {
    required this.globalEventBus,
    required this.sharedPreferencesRepository,
  });

  final GlobalEventBus globalEventBus;
  final SharedPreferencesRepository sharedPreferencesRepository;

  AppBarStateData? _stateData;

  /// Initializes the AppBar state.
  void initialize() {
    _updateStateData();
    emit(
      AppBarState.loaded(
        data: _stateData,
      ),
    );
  }

  /// Updates the app language and emits corresponding events.
  ///
  /// [languageCode]: The language code to set.
  Future<void> updateLanguage({required String languageCode}) async {
    GlobalEvent event = GlobalEvent.switchToEnglish;

    switch (languageCode) {
      case 'de':
        globalEventBus.addEvent(GlobalEvent.showStickyNote);
        event = GlobalEvent.switchToGerman;
        break;
      case 'fr':
        globalEventBus.addEvent(GlobalEvent.showStickyNote);
        event = GlobalEvent.switchToFrench;
        break;
      default:
        globalEventBus.addEvent(GlobalEvent.hideStickyNote);
        event = GlobalEvent.switchToEnglish;
    }

    await sharedPreferencesRepository.setString(
      key: SharedPreferencesKeys.appLanguage,
      value: languageCode,
    );

    globalEventBus.addEvent(event);
  }

  void _updateStateData() {
    _stateData = AppBarStateData();
  }
}
