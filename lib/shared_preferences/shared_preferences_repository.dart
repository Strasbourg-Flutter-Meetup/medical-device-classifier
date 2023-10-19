// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013213353
// 13.10.2023 21:33
import 'package:medical_device_classifier/shared_preferences/mdc_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// An abstract class defining the contract for interacting with shared preferences.
///
/// This abstract class provides a blueprint for classes that manage shared preferences
/// within the application. It declares methods for reading, writing, and deleting
/// data in shared preferences.
abstract class SharedPreferencesRepository {
  /// The instance of [SharedPreferences] for managing shared preferences data.
  MDCSharedPreferences mdcSharedPreferences;

  /// Creates a [SharedPreferencesRepository] with the provided shared preferences instance.
  SharedPreferencesRepository({required this.mdcSharedPreferences});

  /// Deletes the data associated with the given [key] from shared preferences.
  ///
  /// Returns `true` if the data was successfully deleted, and `false` otherwise.
  Future<bool> delete({required String key});

  /// Reads a string value associated with the given [key] from shared preferences.
  ///
  /// Returns the string value if it exists, or an empty string if not found.
  String read({required String key});

  /// Sets a string [value] associated with the given [key] in shared preferences.
  ///
  /// Returns `true` if the value was successfully set, and `false` otherwise.
  Future<bool> setString({required String key, required String value});
}

/// A concrete implementation of the [SharedPreferencesRepository] interface.
///
/// This class provides functionality to interact with shared preferences and
/// implements the methods declared in the [SharedPreferencesRepository] abstract class.
class SharedPreferencesRepositoryImpl extends SharedPreferencesRepository {
  /// Creates a [SharedPreferencesRepositoryImpl] instance with the provided shared preferences instance.
  SharedPreferencesRepositoryImpl({required super.mdcSharedPreferences});

  @override
  Future<bool> delete({required String key}) async =>
      await mdcSharedPreferences.sharedPreferences?.remove(key) ?? false;

  @override
  String read({required String key}) =>
      mdcSharedPreferences.sharedPreferences?.getString(key) ?? '';

  @override
  Future<bool> setString({
    required String key,
    required String value,
  }) async =>
      await mdcSharedPreferences.sharedPreferences?.setString(key, value) ??
      false;
}
