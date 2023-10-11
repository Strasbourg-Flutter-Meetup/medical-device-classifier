// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011195042
// 11.10.2023 19:50
import 'package:medical_device_classifier/dependency_injection/injections/injection_configuration.dart';

/// This class is responsible for configuring the dependency injections for various Cubits in the Medical Device Classifier project.
///
/// It extends the [InjectionConfiguration] class.
class InjectionCubits extends InjectionConfiguration {
  @override
  // ignore: long-method
  configureGetItInjections() {
    // Register the factory methods for each Cubit, providing the necessary dependencies.
    // Add the respective imports for each Cubit to ensure correct references.

    // Example registration:
    //
    //    getIt.registerFactory<DashboardCubit>(
    //            () => DashboardCubit(
    //            serviceA: getIt.get<ServiceA>(),
    //        ),
    //      );
    //
    // Add registrations for other Cubits in a similar manner.

    // It is important to ensure that the necessary dependencies are registered and injected correctly for each Cubit.


  }
}