// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231020203912
// 20.10.2023 20:39
// ID: 20231012214519
// 12.10.2023 21:45
import 'package:supabase_flutter/supabase_flutter.dart';

/// A wrapper class for initializing a Supabase client.
///
/// The [SupabaseWrapper] class provides a convenient way to initialize
/// a Supabase client by encapsulating the initialization process.
class SupabaseWrapper {
  /// Initializes a Supabase client with the specified Supabase URL and
  /// anonymous key.
  ///
  /// This method initializes a Supabase client instance by configuring it
  /// with the provided Supabase URL and anonymous key.
  ///
  /// Parameters:
  /// - `supabaseURL`: The URL of the Supabase project.
  /// - `supabaseAnonKey`: The anonymous key used for authentication.
  ///
  /// Returns:
  /// A [Future] that completes with the initialized Supabase client.
  ///
  /// Example:
  /// ```dart
  /// final supabaseURL = 'https://your-supabase-url.com';
  /// final supabaseAnonKey = 'your-anonymous-key';
  ///
  /// final supabase = await SupabaseWrapper().initialize(
  ///   supabaseURL: supabaseURL,
  ///   supabaseAnonKey: supabaseAnonKey,
  /// );
  ///
  /// // Now you can use the `supabase` client for database operations.
  /// ```
  Future<SupabaseClient> initialize({
    required String supabaseURL,
    required String supabaseAnonKey,
  }) async {
    final supabase = await Supabase.initialize(
      url: supabaseURL,
      anonKey: supabaseAnonKey,
    );
    return supabase.client;
  }
}
