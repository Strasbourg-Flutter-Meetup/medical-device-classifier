// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231030091512
// 30.10.2023 09:15
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// A Dart extension for the `Cubit` class to simplify reinitializing shared preferences
/// using a `SharedPreferencesRepository`.
extension CubitExtension<T> on Cubit<T> {
  /// Reinitializes shared preferences using a provided [SharedPreferencesRepository].
  ///
  /// This method checks if the shared preferences instance is null and, if so,
  /// initializes it using the provided [SharedPreferencesRepository].
  ///
  /// - [sharedPreferencesRepository]: The [SharedPreferencesRepository] to use for
  ///   initializing shared preferences.
  Future<void> sharedPreferencesReinitialization(
    SharedPreferencesRepository sharedPreferencesRepository,
  ) async {
    if (sharedPreferencesRepository.mdcSharedPreferences.sharedPreferences ==
        null) {
      await sharedPreferencesRepository.mdcSharedPreferences
          .initializeSharedPreferences();
    }
  }
}
