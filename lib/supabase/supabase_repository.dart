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

abstract class BackendRepository {
  BackendRepository({
    required this.supabaseClientImpl,
  });

  final SupabaseClientImpl supabaseClientImpl;

  SupabaseClient? get supabaseClient => supabaseClientImpl.supabaseClient;

  bool responseIsNull(Object? response) {
    if (response == null) {
      return true;
    }

    return false;
  }
}
