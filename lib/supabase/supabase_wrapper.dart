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

class SupabaseWrapper {
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
