// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012202806
// 12.10.2023 20:28
import 'dart:async';

import 'package:medical_device_classifier/supabase/supabase_wrapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Abstract class representing a Supabase client.
///
/// This abstract class defines the contract for initializing a Supabase client
/// for interacting with the Supabase backend. It provides a common interface
/// for different implementations of the client.
///
/// Implementers of this class should ensure that the Supabase client is
/// properly initialized with the required Supabase URL and anonymous key
/// before any interactions with the Supabase backend.
abstract class ISupabaseClient {
  /// The Supabase client instance.
  ISupabaseClient? supabaseClient;

  /// Initialize the Supabase client.
  ///
  /// This method should be called to set up the Supabase client with the
  /// provided Supabase URL and anonymous key.
  ///
  /// Throws an error if initialization fails.
  Future<void> initialize({
    required String supabaseURL,
    required String supabaseAnonKey,
  });
}

/// Implementation of the [ISupabaseClient] interface.
///
/// This class provides a concrete implementation of the [ISupabaseClient]
/// interface. It initializes a Supabase client and provides access to it.
///
/// Usage:
///
/// ```dart
/// final supabaseClient = SupabaseClientImpl.instance;
/// await supabaseClient.initialize(
///   supabaseURL: 'YOUR_SUPABASE_URL',
///   supabaseAnonKey: 'YOUR_ANONYMOUS_KEY',
/// );
/// // Now you can use `supabaseClient.supabaseClient` to interact with Supabase.
/// ```
class SupabaseClientImpl extends ISupabaseClient {
  // Private constructor for the Singleton pattern.
  SupabaseClientImpl._();

  /// Singleton instance of [SupabaseClientImpl].
  static final SupabaseClientImpl instance = SupabaseClientImpl._();

  SupabaseWrapper? _supabaseWrapper;

  void setSupabaseWrapper(SupabaseWrapper supabaseWrapper) {
    _supabaseWrapper = supabaseWrapper;
  }

  @override
  Future<void> initialize({
    required String supabaseURL,
    required String supabaseAnonKey,
  }) async {
    // Initialize the Supabase client and set the Supabase client instance.
    supabaseClient = await _supabaseWrapper?.initialize(
      supabaseURL: supabaseURL,
      supabaseAnonKey: supabaseAnonKey,
    );
  }
}