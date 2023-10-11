// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011195457
// 11.10.2023 19:54
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_cubits.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_service.dart';

abstract class Bootstrap {
  void boot();
}

class BootstrapImpl implements Bootstrap {
  @override
  void boot() {
    _configureGetIt();
  }
}

void _configureGetIt() {
  configureGetItInjections(
    injectionConfigurations: [
      InjectionServices(),
      InjectionCubits(),
    ],
  );
}
