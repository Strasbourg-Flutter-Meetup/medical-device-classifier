import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_cubits.dart';
<<<<<<< Updated upstream
import 'package:medical_device_classifier/dependency_injection/injections/injection_service.dart';
=======
import 'package:medical_device_classifier/dependency_injection/injections/injection_repositories.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_services.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_singletons.dart';
>>>>>>> Stashed changes
import 'package:medical_device_classifier/medical_device_classifier.dart';

void main() {
  usePathUrlStrategy();
  _configureGetIt();
  runApp(const MedicalDeviceClassifier());
}

void _configureGetIt() {
  configureGetItInjections(
    injectionConfigurations: [
<<<<<<< Updated upstream
=======
      InjectionSingletons(),
      InjectionRepositories(),
>>>>>>> Stashed changes
      InjectionServices(),
      InjectionCubits(),
    ],
  );
}
