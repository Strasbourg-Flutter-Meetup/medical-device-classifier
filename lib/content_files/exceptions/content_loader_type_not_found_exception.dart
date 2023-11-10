// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021195200
// 21.10.2023 19:52
import 'package:medical_device_classifier/content_files/content_loader_impl.dart';

/// Represents an exception that is thrown when a specific content loader type is not found.
///
/// This exception is used when trying to retrieve a content loader type that
/// doesn't exist or hasn't been registered yet.
class ContentLoaderTypeNotFoundException implements Exception {
  /// Creates an instance of the exception with the provided content loader type.
  ///
  /// [contentLoaderType] represents the type of the content loader that was not found.
  ContentLoaderTypeNotFoundException({required this.contentLoaderType});

  /// The content loader type that triggered the exception.
  final ContentLoaderType contentLoaderType;

  /// Returns a string representation of the exception.
  ///
  /// This overrides the `toString` method to provide a more descriptive message
  /// about the content loader type that was not found.
  @override
  String toString() => "'${contentLoaderType.name}' was not found.";
}
