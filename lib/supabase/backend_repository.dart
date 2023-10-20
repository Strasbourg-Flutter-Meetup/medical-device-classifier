// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012220140
// 12.10.2023 22:01

import 'package:medical_device_classifier/supabase/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// An abstract class representing a backend repository.
///
/// This abstract class serves as the foundation for various repositories that interact
/// with a backend service. It requires a [SupabaseClientImpl] instance to be provided
/// during initialization.
abstract class BackendRepository {
  /// Creates a [BackendRepository] with the provided [supabaseClientImpl].
  ///
  /// The [supabaseClientImpl] is responsible for handling interactions with the backend service.
  BackendRepository({
    required this.supabaseClientImpl,
  });

  /// The implementation of the Supabase client that handles backend interactions.
  final SupabaseClientImpl supabaseClientImpl;

  /// Gets the Supabase client instance from [supabaseClientImpl].
  SupabaseClient? get supabaseClient => supabaseClientImpl.supabaseClient;

  /// Checks if the provided [response] is null.
  ///
  /// Returns `true` if [response] is null, indicating an absence of data, and `false` otherwise.
  bool responseIsNull(Object? response) {
    if (response == null) {
      return true;
    }

    return false;
  }
}
