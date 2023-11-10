// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231027201745
// 27.10.2023 20:17
/// A class representing an option in a decision tree.
class Option {
  /// Creates an [Option] with the specified attributes.
  ///
  /// - [id]: A unique identifier for this option.
  /// - [when]: The condition under which this option is applicable.
  /// - [then]: The identifier of the node to navigate to when this option is selected.
  Option({
    required this.id,
    required this.when,
    required this.then,
  });

  /// A unique identifier for this option.
  final String id;

  /// The condition under which this option is applicable.
  final String when;

  /// The identifier of the node to navigate to when this option is selected.
  final String then;
}
