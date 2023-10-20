// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012203154
// 12.10.2023 20:31

import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_configuration.dart';
import 'package:medical_device_classifier/shared_preferences/mdc_shared_preferences.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';
import 'package:medical_device_classifier/supabase/supabase_wrapper.dart';

/// This class is responsible for configuring the dependency injections for the singleton dependencies used in the Leopold Homepage project.
///
/// It extends the [InjectionConfiguration] class.
class InjectionSingletons extends InjectionConfiguration {
  @override
  // ignore: long-method
  configureGetItInjections() {
    // Register the singletons by calling `getIt.registerSingleton<DependencyType>(...)` for each dependency.
    // Add the respective imports for each dependency to ensure correct references.

    // Example registration:
    getIt.registerSingleton<SupabaseClientImpl>(
      SupabaseClientImpl.instance
        ..setSupabaseWrapper(
          SupabaseWrapper(),
        ),
    );

    // Add registrations for other singleton dependencies in a similar manner.

    // It is important to ensure that the necessary dependencies are registered and injected correctly for each singleton dependency.

    getIt
        .registerSingleton<MDCSharedPreferences>(MDCSharedPreferences.instance);
  }
}
