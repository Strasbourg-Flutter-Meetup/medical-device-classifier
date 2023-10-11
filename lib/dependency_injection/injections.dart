// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011194845
// 11.10.2023 19:48
/// This class is responsible for configuring the dependency injections using GetIt library.
/// It provides a global instance of GetIt and a function to configure the injections.
/// To use this class, call `configureGetItInjections()` with a list of [InjectionConfiguration] instances.
import 'package:get_it/get_it.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_configuration.dart';

/// Global instance of GetIt for managing dependency injections.
final GetIt getIt = GetIt.instance;

/// Configures the dependency injections by calling the `configureGetItInjections()` method of each [InjectionConfiguration] instance.
/// It takes a list of [InjectionConfiguration] instances as a parameter.
void configureGetItInjections({
  required List<InjectionConfiguration> injectionConfigurations,
}) {
  // Iterate through each [InjectionConfiguration] instance and call the `configureGetItInjections()` method.
  for (final injectionConfiguration in injectionConfigurations) {
    injectionConfiguration.configureGetItInjections();
  }
}