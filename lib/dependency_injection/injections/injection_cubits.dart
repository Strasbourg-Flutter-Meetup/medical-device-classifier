// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011195042
// 11.10.2023 19:50
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/bootstrap.dart';
import 'package:medical_device_classifier/content_files/general_explanation_rule_loader.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_configuration.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_state.dart';
<<<<<<< Updated upstream
=======
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_cubit.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_state.dart';
import 'package:medical_device_classifier/shared_preferences/mdc_shared_preferences.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';
>>>>>>> Stashed changes

/// This class is responsible for configuring the dependency injections for various Cubits in the Medical Device Classifier project.
///
/// It extends the [InjectionConfiguration] class.
class InjectionCubits extends InjectionConfiguration {
  @override
  // ignore: long-method
  void configureGetItInjections() {
    // Register the factory methods for each Cubit, providing the necessary dependencies.
    // Add the respective imports for each Cubit to ensure correct references.

    // Example registration:
    getIt.registerFactory<DashboardCubit>(
      () => DashboardCubit(
        const DashboardState.initial(),
<<<<<<< Updated upstream
        bootstrap: const BootstrapImpl(),
=======
        bootstrap: BootstrapImpl(
          supabaseClient: getIt.get<SupabaseClientImpl>(),
          mdcSharedPreferences: getIt.get<MDCSharedPreferences>(),
          generalExplanationRuleLoader:
              getIt.get<GeneralExplanationRuleLoader>(),
        ),
>>>>>>> Stashed changes
      ),
    );
    // Add registrations for other Cubits in a similar manner.

    // It is important to ensure that the necessary dependencies are registered and injected correctly for each Cubit.

    getIt.registerFactory<GeneralExplanationOfRulesCubit>(
      () => GeneralExplanationOfRulesCubit(
        const GeneralExplanationOfRulesState.initial(),
        leoMLDocumentParser: getIt.get<LeoMLDocumentParser>(),
        sharedPreferencesRepository:
            getIt.get<SharedPreferencesRepository>(),
      ),
    );
  }
}
