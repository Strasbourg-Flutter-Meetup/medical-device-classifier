// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231024154043
// 24.10.2023 15:40
import 'package:flutter/material.dart';

/// The `ContentBuilder` abstract class defines a contract for building content
/// based on a generic data type `T`.
///
/// Subclasses that implement this contract should provide an implementation
/// for the `build` method, which is responsible for constructing and returning
/// a widget based on the provided data of type `T`.
///
/// This class is intended to be subclassed, and its `build` method overridden to
/// perform custom content building logic.
///
/// Example:
///
/// ```dart
/// class MyContentBuilder extends ContentBuilder<String> {
///   @override
///   Widget build({required String data}) {
///     // Implement content building logic here.
///     return Text(data);
///   }
/// }
/// ```
///
/// The `ContentBuilder` class is typically used in conjunction with other
/// components to dynamically construct and display UI elements based on the
/// data of type `T`.
abstract class ContentBuilder<T> {
  /// Builds a widget based on the provided data.
  ///
  /// This method should be overridden in subclasses to construct a widget
  /// based on the specific data type `T`.
  ///
  /// Example:
  ///
  /// ```dart
  /// @override
  /// Widget build({required T data}) {
  ///   // Implement content building logic here.
  ///   return Text(data.toString());
  /// }
  /// ```
  Widget build({required T data});
}
