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
import 'package:medical_device_classifier/supabase/anon_key.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';
import 'package:medical_device_classifier/supabase/supabase_url.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A Dart extension for the `Cubit` class to simplify reinitializing shared preferences
/// using a `SharedPreferencesRepository`.
extension CubitExtension<T> on Cubit<T> {
  /// Reinitializes the data sources connection by reinitializing shared preferences
  /// and the Supabase client.
  ///
  /// This function reinitializes the data sources connection by first reinitializing
  /// the [SharedPreferencesRepository] using the provided `sharedPreferencesRepository`,
  /// and then reinitializes the Supabase client using the provided `supabaseClient`.
  ///
  /// - [sharedPreferencesRepository]: The repository for managing shared preferences data.
  /// - [supabaseClient]: The Supabase client instance used for data sources.
  Future<void> dataSourcesConnectionReinitialization({
    required SharedPreferencesRepository sharedPreferencesRepository,
    required ISupabaseClient supabaseClient,
  }) async {
    await sharedPreferencesReinitialization(
      sharedPreferencesRepository: sharedPreferencesRepository,
    );
    await supabaseClientReinitialization(supabaseClient: supabaseClient);
  }

  /// Reinitializes shared preferences using a provided [SharedPreferencesRepository].
  ///
  /// This method checks if the shared preferences instance is null and, if so,
  /// initializes it using the provided [SharedPreferencesRepository].
  ///
  /// - [sharedPreferencesRepository]: The [SharedPreferencesRepository] to use for
  ///   initializing shared preferences.
  Future<void> sharedPreferencesReinitialization({
    required SharedPreferencesRepository sharedPreferencesRepository,
  }) async {
    if (sharedPreferencesRepository.mdcSharedPreferences.sharedPreferences ==
        null) {
      await sharedPreferencesRepository.mdcSharedPreferences
          .initializeSharedPreferences();
    }
  }

  /// Reinitializes the provided Supabase client with the specified Supabase URL and anonymous key.
  ///
  /// This function checks if the provided `supabaseClient` is not already initialized,
  /// and if not, it initializes the Supabase client with the specified `supabaseURL` and `anonKey`.
  ///
  /// - [supabaseURL]: The URL of the Supabase server.
  /// - [anonKey]: The anonymous key used for authentication.
  /// - [supabaseClient]: The Supabase client instance to be reinitialized.
  Future<void> supabaseClientReinitialization({
    required ISupabaseClient supabaseClient,
  }) async {
    supabaseClient.supabaseClient ??= SupabaseClient(supabaseURL, anonKey);
  }
}
