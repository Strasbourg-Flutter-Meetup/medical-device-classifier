// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013212617
// 13.10.2023 21:26
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_configuration.dart';
import 'package:medical_device_classifier/shared_preferences/mdc_shared_preferences.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';
import 'package:medical_device_classifier/supabase/database/database_fetch_data_repository.dart';
import 'package:medical_device_classifier/supabase/storage/storage_download_repository.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';

/// This class is responsible for configuring the dependency injections for the services used in the Medical Device Classifier project.
///
/// It extends the [InjectionConfiguration] class.
class InjectionRepositories extends InjectionConfiguration {
  @override
  //ignore: long-method
  void configureGetItInjections() {
    // Register the factory methods for each repository, providing the necessary dependencies.
    // Add the respective imports for each service to ensure correct references.

    // Example registration:
    getIt.registerFactory<DatabaseFetchDataRepository>(
      () => DatabaseFetchDataRepository(
        supabaseClientImpl: getIt.get<SupabaseClientImpl>(),
      ),
    );

    // Add registrations for other services in a similar manner.

    // It is important to ensure that the necessary dependencies are registered and injected correctly for each repository.

    getIt.registerFactory<StorageDownloadRepository>(
      () => StorageDownloadRepository(
        supabaseClientImpl: getIt.get<SupabaseClientImpl>(),
      ),
    );

    getIt.registerFactory<SharedPreferencesRepository>(
      () => SharedPreferencesRepositoryImpl(
        mdcSharedPreferences: getIt.get<MDCSharedPreferences>(),
      ),
    );
  }
}
