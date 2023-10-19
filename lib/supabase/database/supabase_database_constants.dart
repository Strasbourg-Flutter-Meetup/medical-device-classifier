// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012221554
// 12.10.2023 22:15

class SupabaseDatabaseConstants {
  // meta_data_decision_tree
  static const String tableNameMetaDataDecisionTree = 'meta_data_decision_tree';
  static const String attributeMetaDataDecisionTreeId = 'id';
  static const String attributeMetaDataDecisionTreeCreatedAt = 'created_at';
  static const String attributeMetaDataDecisionTreeUpdatedAt = 'updated_at';
  static const String attributeMetaDataDecisionTreeFileName = 'file_name';
  static const String attributeMetaDataDecisionTreeLanguageCode =
      'language_code';

// meta_data_definitions
  static const String tableNameMetaDataDefinitions = 'meta_data_definitions';
  static const String attributeMetaDefinitionsId = 'id';
  static const String attributeMetaDataDefinitionsCreatedAt = 'created_at';
  static const String attributeMetaDataDefinitionsUpdatedAt = 'updated_at';
  static const String attributeMetaDataDefinitionsFileName = 'file_name';
  static const String attributeMetaDataDefinitionsLanguageCode =
      'language_code';

// meta_data_implementing_rules
  static const String tableNameMetaDataImplementingRules =
      'meta_data_implementing_rules';
  static const String attributeMetaDataImplementingRulesId = 'id';
  static const String attributeMetaDataImplementingRulesCreatedAt =
      'created_at';
  static const String attributeMetaDataImplementingRulesUpdatedAt =
      'updated_at';
  static const String attributeMetaDataImplementingRulesFileName = 'file_name';
  static const String attributeMetaDataImplementingRulesLanguageCode =
      'language_code';

  // meta_data_implementing_rules
  static const String tableNameMetaDataRules = 'meta_data_rules';
  static const String attributeMetaDataRulesId = 'id';
  static const String attributeMetaDataRulesCreatedAt = 'created_at';
  static const String attributeMetaDataRulesUpdatedAt = 'updated_at';
  static const String attributeMetaDataRulesFileName = 'file_name';
  static const String attributeMetaDataRulesLanguageCode = 'language_code';
}
