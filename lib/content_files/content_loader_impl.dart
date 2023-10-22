// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021145439
// 21.10.2023 14:54
import 'dart:convert';

import 'package:medical_device_classifier/content_files/content_loader.dart';
import 'package:medical_device_classifier/content_files/exceptions/content_loader_type_not_found_exception.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/supabase/database/supabase_database_constants.dart';
import 'package:medical_device_classifier/supabase/storage/supabase_storage_constants.dart';

/// Enum representing different types of content loaders.
///
/// The [ContentLoaderType] enum defines various content loader types that
/// can be used to load different types of content in the application. Each
/// enum value corresponds to a specific content type that the application
/// can load and manage.
enum ContentLoaderType {
  /// Represents the content loader for general explanation rules.
  generalExplanationRules,

  /// Represents the content loader for definitions.
  definitions,

  /// Represents the content loader for implementing rules.
  implementingRules,

  /// Represents the content loader for a decision tree.
  decisionTree,
}

/// A concrete implementation of the [ContentLoader] class for loading various
/// types of content in the application.
///
/// The [ContentLoaderImpl] class extends [ContentLoader] and provides specific
/// implementations for loading content of different types, such as general
/// explanation rules, definitions, implementing rules, and decision trees. It
/// interacts with databases, downloads content files, and stores data in
/// SharedPreferences.
class ContentLoaderImpl extends ContentLoader {
  /// Creates a [ContentLoaderImpl] instance with the required dependencies.
  ///
  /// The [databaseFetchDataRepository] provides access to database operations,
  /// the [storageDownloadRepository] handles file downloads, and the
  /// [sharedPreferencesRepository] manages local data storage.
  ContentLoaderImpl({
    required super.databaseFetchDataRepository,
    required super.storageDownloadRepository,
    required super.sharedPreferencesRepository,
  });

  /// Loads content of a specified type based on [contentLoaderType].
  ///
  /// This method reads the current language code from SharedPreferences and
  /// checks whether the data needs to be updated. If an update is required,
  /// it downloads the content from the remote database, saves it to
  /// SharedPreferences, and updates the language code and timestamp.

  @override
  Future<void> load({required ContentLoaderType contentLoaderType}) async {
    final sharedPreferencesLanguageCode = sharedPreferencesRepository.read(
      key: _getSharedPreferencesKey(contentLoaderType).$3,
    );

    final shouldUpdateData =
        await _shouldUpdateData(sharedPreferencesLanguageCode);

    if (shouldUpdateData) {
      final contentData = await _downloadFromRemote(
        contentLoaderType: contentLoaderType,
        languageCode: currentLocale.languageCode,
      );
      await _saveDataIntoSharedPreferences(
        contentType: contentLoaderType,
        contentToStore: contentData,
      );
    }
  }

  /// Retrieves the Supabase database keys based on the [contentLoaderType].
  ///
  /// This method takes a [contentLoaderType] enum value and returns a tuple
  /// containing the Supabase database table name, file name attribute, and
  /// language code attribute associated with the specified [contentLoaderType].
  ///
  /// Parameters:
  /// - `contentLoaderType`: The type of content loader specifying the type
  ///   of database keys to retrieve.
  ///
  /// Returns:
  /// A tuple containing the following values in order:
  /// - Supabase database table name.
  /// - Supabase database file name attribute.
  /// - Supabase database language code attribute.
  ///
  /// Throws:
  /// - [ContentLoaderTypeNotFoundException]: If an unsupported or undefined
  ///   [contentLoaderType] is provided.
  ///
  /// Example:
  /// ```dart
  /// var keys = _getSupabaseKeys(ContentLoaderType.generalExplanationRules);
  /// print(keys); // ('tableName', 'fileNameAttribute', 'languageCodeAttribute')
  /// ```
  (String, String, String) _getSupabaseKeys(
    ContentLoaderType contentLoaderType,
  ) {
    switch (contentLoaderType) {
      case ContentLoaderType.generalExplanationRules:
        return (
          SupabaseDatabaseConstants.tableNameMetaDataRules,
          SupabaseDatabaseConstants.attributeMetaDataRulesFileName,
          SupabaseDatabaseConstants.attributeMetaDataRulesLanguageCode,
        );
      case ContentLoaderType.definitions:
        return (
          SupabaseDatabaseConstants.tableNameMetaDataDefinitions,
          SupabaseDatabaseConstants.attributeMetaDataDefinitionsFileName,
          SupabaseDatabaseConstants.attributeMetaDataDefinitionsLanguageCode,
        );
      case ContentLoaderType.implementingRules:
        return (
          SupabaseDatabaseConstants.tableNameMetaDataImplementingRules,
          SupabaseDatabaseConstants.attributeMetaDataImplementingRulesFileName,
          SupabaseDatabaseConstants
              .attributeMetaDataImplementingRulesLanguageCode,
        );
      case ContentLoaderType.decisionTree:
        return (
          SupabaseDatabaseConstants.tableNameMetaDataDecisionTree,
          SupabaseDatabaseConstants.attributeMetaDataDecisionTreeFileName,
          SupabaseDatabaseConstants.attributeMetaDataDecisionTreeLanguageCode,
        );
      default:
        throw ContentLoaderTypeNotFoundException(
          contentLoaderType: contentLoaderType,
        );
    }
  }

  /// Downloads content data from the remote source based on the specified
  /// [contentLoaderType] and [languageCode].
  ///
  /// This asynchronous method retrieves content data from a remote source
  /// such as a database and returns it as a UTF-8 decoded string. It uses
  /// the provided [contentLoaderType] to determine the relevant database
  /// table and column names and the [languageCode] to filter the data.
  ///
  /// Parameters:
  /// - `contentLoaderType`: The type of content loader specifying the data
  ///   source to retrieve content from.
  /// - `languageCode`: The language code used to filter content data for a
  ///   specific language.
  ///
  /// Returns:
  /// A [Future] that completes with the downloaded content data as a UTF-8
  /// decoded string.
  ///
  /// Example:
  /// ```dart
  /// var contentData = await _downloadFromRemote(
  ///   contentLoaderType: ContentLoaderType.generalExplanationRules,
  ///   languageCode: 'en_US',
  /// );
  /// print(contentData); // 'This is the content data...'
  /// ```
  Future<String> _downloadFromRemote({
    required ContentLoaderType contentLoaderType,
    required String languageCode,
  }) async {
    final supabaseKeys = _getSupabaseKeys(contentLoaderType);
    final results = await databaseFetchDataRepository.fetchData(
      tableName: supabaseKeys.$1,
      columns: supabaseKeys.$2,
      query: {
        supabaseKeys.$3: languageCode,
      },
    );
    final fileName = _getFileName(results);

    if (fileName.isEmpty) {
      return '';
    }

    final jsonFile = await storageDownloadRepository.download(
      bucketName: SupabaseStorageConstants.jsonFileBucket,
      fileName: fileName,
    );

    return utf8.decode(jsonFile?.toList() ?? []);
  }

  /// Saves content data into SharedPreferences for a specified [contentType].
  ///
  /// This asynchronous method is responsible for storing content data and
  /// related information into the SharedPreferences storage. It uses the
  /// [contentType] to determine the relevant SharedPreferences keys for
  /// storing the data, update timestamp, and language code.
  ///
  /// Parameters:
  /// - `contentType`: The type of content specifying the category of data
  ///   being stored.
  /// - `contentToStore`: The content data to be stored in SharedPreferences.
  ///
  /// Returns:
  /// A [Future] representing the completion of the data-saving operation.
  ///
  /// Example:
  /// ```dart
  /// await _saveDataIntoSharedPreferences(
  ///   contentType: ContentLoaderType.definitions,
  ///   contentToStore: 'This is the definitions content...',
  /// );
  /// ```
  Future<void> _saveDataIntoSharedPreferences({
    required ContentLoaderType contentType,
    required String contentToStore,
  }) async {
    final sharedPreferencesKeys = _getSharedPreferencesKey(contentType);

    // Store content data
    await sharedPreferencesRepository.setString(
      key: sharedPreferencesKeys.$1,
      value: contentToStore,
    );

    // Store update timestamp
    await sharedPreferencesRepository.setString(
      key: sharedPreferencesKeys.$2,
      value: DateTime.now().toUtc().toIso8601String(),
    );

    // Store language code
    await sharedPreferencesRepository.setString(
      key: sharedPreferencesKeys.$3,
      value: currentLocale.languageCode,
    );
  }

  /// Retrieves SharedPreferences keys based on the specified [contentLoaderType].
  ///
  /// This method maps a [ContentLoaderType] to a tuple of SharedPreferences
  /// keys related to the content loading process. It is used to determine the
  /// keys for storing content data, update timestamps, and language codes in
  /// SharedPreferences.
  ///
  /// Parameters:
  /// - `contentLoaderType`: The type of content specifying the category of data
  ///   for which SharedPreferences keys are needed.
  ///
  /// Returns:
  /// A tuple of three strings representing the SharedPreferences keys:
  /// - The key for storing content data.
  /// - The key for storing the local update timestamp.
  /// - The key for storing the language code.
  ///
  /// Throws:
  /// - [ContentLoaderTypeNotFoundException] if the specified [contentLoaderType]
  ///   is not recognized.
  ///
  /// Example:
  /// ```dart
  /// final keys = _getSharedPreferencesKey(ContentLoaderType.definitions);
  /// print(keys.$1); // Prints the content data key.
  /// print(keys.$2); // Prints the update timestamp key.
  /// print(keys.$3); // Prints the language code key.
  /// ```
  (String, String, String) _getSharedPreferencesKey(
    ContentLoaderType contentLoaderType,
  ) {
    switch (contentLoaderType) {
      case ContentLoaderType.generalExplanationRules:
        return (
          SharedPreferencesKeys.rules,
          SharedPreferencesKeys.rulesLocalUpdateDate,
          SharedPreferencesKeys.rulesLanguageCode,
        );
      // Handle other content types similarly
      case ContentLoaderType.definitions:
        return (
          SharedPreferencesKeys.definitions,
          SharedPreferencesKeys.definitionLocalUpdateDate,
          SharedPreferencesKeys.definitionsLanguageCode,
        );
      case ContentLoaderType.implementingRules:
        return (
          SharedPreferencesKeys.implementingRules,
          SharedPreferencesKeys.implementingRulesLocalUpdateDate,
          SharedPreferencesKeys.implementingRulesLanguageCode,
        );
      case ContentLoaderType.decisionTree:
        return (
          SharedPreferencesKeys.decisionTree,
          SharedPreferencesKeys.decisionTreeLocalUpdateDate,
          SharedPreferencesKeys.decisionTreeLanguageCode,
        );
      default:
        throw ContentLoaderTypeNotFoundException(
          contentLoaderType: contentLoaderType,
        );
    }
  }

  /// Determines whether the content data should be updated based on the
  /// current language code and update timestamps stored in SharedPreferences.
  ///
  /// This method checks if an update is required by comparing the current
  /// language code with the one stored in SharedPreferences. It also compares
  /// the local update timestamp with the remote update timestamp obtained
  /// from the database.
  ///
  /// Parameters:
  /// - `sharedPreferencesLanguageCode`: The language code stored in SharedPreferences.
  ///
  /// Returns:
  /// A boolean value indicating whether an update is needed.
  ///
  /// Example:
  /// ```dart
  /// final needsUpdate = _shouldUpdateData('en_US');
  /// print(needsUpdate); // Prints 'true' if an update is needed.
  /// ```
  Future<bool> _shouldUpdateData(String sharedPreferencesLanguageCode) async {
    if (sharedPreferencesLanguageCode.isEmpty ||
        currentLocale.languageCode != sharedPreferencesLanguageCode) {
      return true;
    }

    final localUpdateData = sharedPreferencesRepository.read(
      key: SharedPreferencesKeys.rulesLocalUpdateDate,
    );
    final remoteUpdateData = await _fetchRemoteUpdateData();

    return !_isRemoteDataOlder(remoteUpdateData, localUpdateData);
  }

  /// Fetches the remote update timestamp for content data.
  ///
  /// This method queries the database to obtain the remote update timestamp
  /// for content data based on the current language code.
  ///
  /// Returns:
  /// An object representing the remote update timestamp, typically a string or null.
  ///
  /// Example:
  /// ```dart
  /// final remoteTimestamp = _fetchRemoteUpdateData();
  /// print(remoteTimestamp); // Prints the remote update timestamp.
  /// ```
  Future<Object?> _fetchRemoteUpdateData() async =>
      await databaseFetchDataRepository.fetchData(
        tableName: SupabaseDatabaseConstants.tableNameMetaDataRules,
        columns: SupabaseDatabaseConstants.attributeMetaDataRulesUpdatedAt,
        query: {
          SupabaseDatabaseConstants.attributeMetaDataRulesLanguageCode:
              currentLocale.languageCode,
        },
      );

  /// Checks if the remote data is older than the local data based on timestamps.
  ///
  /// This method compares the remote update timestamp obtained from the database
  /// with the local update timestamp. It returns `true` if the remote data is
  /// older, indicating that an update is needed.
  ///
  /// Parameters:
  /// - `remoteUpdateData`: The remote update timestamp, typically obtained
  ///   from the database.
  /// - `localUpdateData`: The local update timestamp stored in SharedPreferences.
  ///
  /// Returns:
  /// A boolean value indicating whether the remote data is older.
  ///
  /// Example:
  /// ```dart
  /// final isOlder = _isRemoteDataOlder(remoteTimestamp, '2023-10-20T12:00:00Z');
  /// print(isOlder); // Prints 'true' if the remote data is older.
  /// ```
  bool _isRemoteDataOlder(Object? remoteUpdateData, String localUpdateData) {
    if (remoteUpdateData is List) {
      final remoteDateTime = DateTime.parse(
        ((remoteUpdateData.first as Map<String, dynamic>)[
                SupabaseDatabaseConstants.attributeMetaDataRulesUpdatedAt]
            as String),
      );

      final localDateTime = DateTime.parse(localUpdateData);
      return remoteDateTime.isBefore(localDateTime);
    }

    return false;
  }

  /// Retrieves the file name from the results obtained from the database.
  ///
  /// This method extracts the file name from the results, typically a list of
  /// data obtained from the database query. It checks if the file name exists
  /// in the results and returns it as a string.
  ///
  /// Parameters:
  /// - `results`: The results obtained from a database query, usually a list
  ///   of data.
  ///
  /// Returns:
  /// A string representing the file name or an empty string if not found.
  ///
  /// Example:
  /// ```dart
  /// final results = [
  ///   {'file_name': 'example.json', 'data': '...'},
  ///   // Other result entries...
  /// ];
  /// final fileName = _getFileName(results);
  /// print(fileName); // Prints 'example.json'.
  /// ```
  String _getFileName(Object? results) {
    if (results is List) {
      final firstResultMap = results.first as Map<String, dynamic>;

      if (firstResultMap.containsKey(
        SupabaseDatabaseConstants.attributeMetaDataRulesFileName,
      )) {
        return firstResultMap[
            SupabaseDatabaseConstants.attributeMetaDataRulesFileName] as String;
      }
    }

    return '';
  }
}
