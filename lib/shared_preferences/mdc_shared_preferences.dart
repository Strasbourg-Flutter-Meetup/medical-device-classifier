// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013214743
// 13.10.2023 21:47

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A singleton class for managing shared preferences in the Medical Device Classifier (MDC) application.
///
/// This class provides a single point of access to shared preferences for storing and retrieving
/// application data. It follows the singleton design pattern to ensure that there is only one instance
/// of shared preferences throughout the application's lifecycle.
class MDCSharedPreferences {
  MDCSharedPreferences._();

  /// The singleton instance of [MDCSharedPreferences].
  static final MDCSharedPreferences instance = MDCSharedPreferences._();

  /// The instance of [SharedPreferences] for managing shared preferences data.
  SharedPreferences? sharedPreferences;

  /// Initializes the shared preferences instance for use in the application.
  ///
  /// This method should be called during application startup to initialize the shared preferences
  /// instance. It allows the application to store and retrieve data persistently.
  Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
