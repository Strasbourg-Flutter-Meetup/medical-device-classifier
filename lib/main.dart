import 'package:flutter/material.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_cubits.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_leoml.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_repositories.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_services.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_singletons.dart';
import 'package:medical_device_classifier/medical_device_classifier.dart';
/// The entry point of the application.
///
/// It configures the dependency injection using GetIt and runs the `MedicalDeviceClassifier` app.
void main() {
  // Configure GetIt dependency injections.
  _configureGetIt();

  // Run the `MedicalDeviceClassifier` app.
  runApp(const MedicalDeviceClassifier());
}

/// Configures dependency injections using GetIt.
///
/// This function sets up the necessary injection configurations for the application.
void _configureGetIt() {
  // Configure GetIt injections using predefined configurations.
  configureGetItInjections(
    injectionConfigurations: [
      InjectionSingletons(),
      InjectionRepositories(),
      InjectionServices(),
      InjectionCubits(),
      InjectionLeoML(),
    ],
  );
}

