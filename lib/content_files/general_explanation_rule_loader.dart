// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016111847
// 16.10.2023 11:18
import 'dart:convert';
import 'dart:ui';

import 'package:medical_device_classifier/content_files/content_loader.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/supabase/database/supabase_database_constants.dart';
import 'package:medical_device_classifier/supabase/storage/supabase_storage_constants.dart';

/// A class responsible for loading and managing general explanation rules.
///
/// This class extends [ContentLoader] and implements logic to fetch, update,
/// and store general explanation rules from a remote database and in
/// local SharedPreferences.
class GeneralExplanationRuleLoader extends ContentLoader {
  /// Creates a [GeneralExplanationRuleLoader] with the required dependencies.
  ///
  /// The [databaseFetchDataRepository] provides access to database operations,
  /// the [storageDownloadRepository] handles file downloads, and the
  /// [sharedPreferencesRepository] manages local data storage.
  GeneralExplanationRuleLoader({
    required super.databaseFetchDataRepository,
    required super.storageDownloadRepository,
    required super.sharedPreferencesRepository,
  });

  @override
  Future<void> load() async {
    final sharedPreferencesLanguageCode = sharedPreferencesRepository.read(
      key: SharedPreferencesKeys.rulesLanguageCode,
    );

    if (_shouldUpdateRulesData(sharedPreferencesLanguageCode)) {
      final rulesData =
          await _downloadFromRemote(languageCode: currentLocale.languageCode);
      await _saveDataIntoSharedPreferences(
        rulesToStoreInSharedPreferences: rulesData,
      );
    }
  }

  Future<String> _downloadFromRemote({required String languageCode}) async {
    final results = await databaseFetchDataRepository.fetchData(
      tableName: SupabaseDatabaseConstants.tableNameMetaDataRules,
      columns: SupabaseDatabaseConstants.attributeMetaDataRulesFileName,
      query: {
        SupabaseDatabaseConstants.attributeMetaDataRulesLanguageCode:
            languageCode,
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

  Future<void> _saveDataIntoSharedPreferences({
    required String rulesToStoreInSharedPreferences,
  }) async {
    await sharedPreferencesRepository.setString(
      key: SharedPreferencesKeys.rules,
      value: rulesToStoreInSharedPreferences,
    );

    await sharedPreferencesRepository.setString(
      key: SharedPreferencesKeys.rulesLocalUpdateDate,
      value: DateTime.now().toUtc().toIso8601String(),
    );

    await sharedPreferencesRepository.setString(
      key: SharedPreferencesKeys.rulesLanguageCode,
      value: currentLocale.languageCode,
    );
  }

  bool _shouldUpdateRulesData(String sharedPreferencesLanguageCode) {
    if (sharedPreferencesLanguageCode.isEmpty ||
        currentLocale.languageCode != sharedPreferencesLanguageCode) {
      return true;
    }

    final localUpdateData = sharedPreferencesRepository.read(
      key: SharedPreferencesKeys.rulesLocalUpdateDate,
    );
    final remoteUpdateData = _fetchRemoteUpdateData();

    return !_isRemoteDataOlder(remoteUpdateData, localUpdateData);
  }

  Object? _fetchRemoteUpdateData() {
    return databaseFetchDataRepository.fetchData(
      tableName: SupabaseDatabaseConstants.tableNameMetaDataRules,
      columns: SupabaseDatabaseConstants.attributeMetaDataRulesUpdatedAt,
      query: {
        SupabaseDatabaseConstants.attributeMetaDataRulesLanguageCode:
            currentLocale.languageCode,
      },
    );
  }

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
