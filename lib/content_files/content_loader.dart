// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016111636
// 16.10.2023 11:16
import 'package:flutter/material.dart';
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';
import 'package:medical_device_classifier/routing/go_router_context.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';
import 'package:medical_device_classifier/supabase/database/database_fetch_data_repository.dart';
import 'package:medical_device_classifier/supabase/storage/storage_download_repository.dart';

/// An abstract class representing a content loader.
///
/// This class defines the common structure and dependencies required for
/// loading and managing content. Subclasses should extend this class
/// and provide specific implementations for loading content from various sources.
abstract class ContentLoader {
  /// Creates a [ContentLoader] with the required dependencies.
  ///
  /// The [databaseFetchDataRepository] provides access to database operations,
  /// the [storageDownloadRepository] handles file downloads, and the
  /// [sharedPreferencesRepository] manages local data storage.
  ContentLoader({
    required this.databaseFetchDataRepository,
    required this.storageDownloadRepository,
    required this.sharedPreferencesRepository,
  });

  final IDatabaseFetchDataRepository databaseFetchDataRepository;
  final IStorageDownloadRepository storageDownloadRepository;
  final SharedPreferencesRepository sharedPreferencesRepository;

  /// Returns the current locale based on the context provided by the router.
  Locale get currentLocale => Localizations.localeOf(goRouterContext!);

  /// Loads and manages content based on predefined rules.
  ///
  /// This method is responsible for determining whether content needs to be updated
  /// based on certain conditions. It first reads the language code from shared preferences.
  ///
  /// If the stored language code is empty or different from the current locale's language code,
  /// it initiates a download of new content using the [_downloadFromRemote] method and
  /// updates the content in local storage using the [_saveDataIntoSharedPreferences] method.
  ///
  /// This method encapsulates the logic for checking and updating content to ensure
  /// that the content is always up-to-date based on language and other criteria.
  ///
  /// - [sharedPreferencesLanguageCode]: The language code stored in shared preferences.
  ///
  /// Throws an exception if an error occurs during content retrieval or storage.
  Future<void> load({required ContentLoaderType contentLoaderType});
}
