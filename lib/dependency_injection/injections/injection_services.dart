// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011195334
// 11.10.2023 19:53
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';
import 'package:medical_device_classifier/decision_tree/decision_tree.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_configuration.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';
import 'package:medical_device_classifier/supabase/database/database_fetch_data_repository.dart';
import 'package:medical_device_classifier/supabase/storage/storage_download_repository.dart';

/// This class is responsible for configuring the dependency injections for the services used in the Medical Device Classifier project.
///
/// It extends the [InjectionConfiguration] class.
class InjectionServices extends InjectionConfiguration {
  @override
  //ignore: long-method
  void configureGetItInjections() {
    // Register the factory methods for each service, providing the necessary dependencies.
    // Add the respective imports for each service to ensure correct references.

    // Example registration:
    getIt.registerFactory<ContentLoaderImpl>(
      () => ContentLoaderImpl(
        databaseFetchDataRepository: getIt.get<DatabaseFetchDataRepository>(),
        storageDownloadRepository: getIt.get<StorageDownloadRepository>(),
        sharedPreferencesRepository: getIt.get<SharedPreferencesRepository>(),
      ),
    );

    // Add registrations for other services in a similar manner.

    // It is important to ensure that the necessary dependencies are registered and injected correctly for each service.

    getIt.registerFactory<LeoMLDocumentParser>(
      () => LeoMLDocumentParser(),
    );

    getIt.registerFactory<DecisionTreeImpl>(
      () => DecisionTreeImpl(),
    );
  }
}
