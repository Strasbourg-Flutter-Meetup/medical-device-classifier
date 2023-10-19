// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011194935
// 11.10.2023 19:49
/// This abstract class serves as a base for defining injection configurations.
/// Subclasses should implement the `configureGetItInjections()` method to configure the dependency injections using GetIt.
abstract class InjectionConfiguration {
  /// Configures the dependency injections using GetIt.
  /// Subclasses should override this method to provide their specific injection configurations.
  void configureGetItInjections();
}
