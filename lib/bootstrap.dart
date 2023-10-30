// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011195457
// 11.10.2023 19:54

import 'dart:core';

import 'package:medical_device_classifier/content_files/content_loader.dart';
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';
import 'package:medical_device_classifier/shared_preferences/mdc_shared_preferences.dart';
import 'package:medical_device_classifier/supabase/anon_key.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';
import 'package:medical_device_classifier/supabase/supabase_url.dart';

/// The `Bootstrap` abstract class defines a contract for bootstrapping operations.
///
/// Subclasses that implement this contract should provide an implementation
/// for the `boot` method, which is responsible for initializing components or
/// performing any necessary setup during the bootstrapping process.
///
/// This class is intended to be subclassed, and its `boot` method overridden to
/// perform custom bootstrapping logic.
///
/// Example:
///
/// ```dart
/// class MyBootstrap extends Bootstrap {
///   @override
///   Future<bool> boot() async {
///     // Implement bootstrapping logic here.
///     return true; // Return true if bootstrapping succeeds.
///   }
/// }
/// ```
abstract class Bootstrap {
  /// Initializes the bootstrapping process.
  ///
  /// This method should be overridden in subclasses to perform asynchronous or
  /// synchronous operations required during bootstrapping.
  ///
  /// Example:
  ///
  /// ```dart
  /// @override
  /// Future<bool> boot() async {
  ///   await _loadDecisionTree();
  ///   await _loadDefinitions();
  ///   await _loadImplementingRules();
  ///   return true; // Return true if bootstrapping succeeds.
  /// }
  /// ```
  Future<bool> boot();
}

/// The `BootstrapImpl` class is an implementation of the `Bootstrap` contract.
///
/// It provides a concrete implementation of the `boot` method, where various
/// asynchronous operations can be performed to initialize components or data
/// during the bootstrapping process.
///
/// Example:
///
/// ```dart
/// final bootstrap = BootstrapImpl();
/// bootstrap.boot();
/// ```
class BootstrapImpl implements Bootstrap {
  /// Creates an instance of `BootstrapImpl`.
  const BootstrapImpl({
    required this.supabaseClient,
    required this.mdcSharedPreferences,
    required this.contentLoaderImpl,
  });

  final ISupabaseClient supabaseClient;
  final MDCSharedPreferences mdcSharedPreferences;
  final ContentLoader contentLoaderImpl;

  /// Initializes the bootstrapping process.
  ///
  /// This method is responsible for performing asynchronous operations to
  /// initialize components or data during the bootstrapping process.
  ///
  /// It loads a decision tree, definitions, implementing rules, and
  /// general explanations of rules.
  ///
  /// Example:
  ///
  /// ```dart
  /// @override
  /// Future<bool> boot() async {
  ///   await _initSupabaseClient();
  ///   await _initSharedPreferences();
  ///   await _loadDecisionTree();
  ///   await _loadDefinitions();
  ///   await _loadImplementingRules();
  ///   await _loadGeneralExplanationOfRules();
  ///   return true; // Return true if bootstrapping succeeds.
  /// }
  /// ```
  @override
  Future<bool> boot() async {
    await _initSupabaseClient();
    await _initSharedPreferences();
    await _loadDecisionTree();
    await _loadDefinitions();
    await _loadImplementingRules();
    await _loadGeneralExplanationOfRules();

    return true;
  }

  /// Initializes the Supabase client for making authenticated requests to a Supabase database.
  ///
  /// This method sets up the Supabase client with the provided Supabase URL and anonymous key.
  ///
  /// - [supabaseURL]: The URL of your Supabase project. It typically follows the format
  ///   `https://your-project-id.supabase.co`.
  /// - [supabaseAnonKey]: The anonymous key used for authentication with Supabase.
  ///
  /// This method must be called before making any requests to the Supabase database.
  ///
  /// Example:
  ///
  /// ```dart
  /// await _initSupabaseClient(
  ///   supabaseURL: 'https://your-project-id.supabase.co',
  ///   supabaseAnonKey: 'your-anonymous-key',
  /// );
  /// ```
  ///
  /// Make sure to call this method early in your application initialization to set up
  /// the Supabase client for authentication and data access.
  ///
  /// Throws a [SupabaseException] if the initialization process encounters an error.
  Future<void> _initSupabaseClient() async {
    await supabaseClient.initialize(
      supabaseURL: supabaseURL,
      supabaseAnonKey: anonKey,
    );
  }

  Future<void> _initSharedPreferences() async {
    await mdcSharedPreferences.initializeSharedPreferences();
  }

  Future<void> _loadDecisionTree() async {
    await contentLoaderImpl.load(
      contentLoaderType: ContentLoaderType.decisionTree,
    );
  }

  Future<void> _loadDefinitions() async {
    await contentLoaderImpl.load(
      contentLoaderType: ContentLoaderType.definitions,
    );
  }

  Future<void> _loadImplementingRules() async {
    await contentLoaderImpl.load(
      contentLoaderType: ContentLoaderType.implementingRules,
    );
  }

  Future<void> _loadGeneralExplanationOfRules() async {
    await contentLoaderImpl.load(
      contentLoaderType: ContentLoaderType.generalExplanationRules,
    );
  }
}
