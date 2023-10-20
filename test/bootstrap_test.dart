// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012132149
// 12.10.2023 13:21
import 'package:medical_device_classifier/bootstrap.dart';
import 'package:medical_device_classifier/content_files/general_explanation_rule_loader.dart';
import 'package:medical_device_classifier/shared_preferences/mdc_shared_preferences.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'bootstrap_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SupabaseClientImpl>(),
  MockSpec<SharedPreferencesRepository>(),
  MockSpec<MDCSharedPreferences>(),
  MockSpec<GeneralExplanationRuleLoader>(),
])
@GenerateNiceMocks([MockSpec<SupabaseClientImpl>()])
void main() {
  final bootstrap = BootstrapImpl(
    supabaseClient: MockSupabaseClientImpl(),
    mdcSharedPreferences: MockMDCSharedPreferences(),
    generalExplanationRuleLoader: MockGeneralExplanationRuleLoader(),
  );

  group('Bootstrap', () {
    test('should define a boot method', () {
      expect(
        bootstrap.boot(),
        completion(isTrue),
      ); // Check that it returns true
      expect(
        bootstrap.boot(),
        completion(isTrue),
      ); // Check that it returns true
    });

    test('boot method should be overridden in subclasses', () {
      const bootstrap = NegativeTestBootstrap();
      expect(
        () async => await bootstrap.boot(),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('BootstrapImpl', () {
    test('should initialize a BootstrapImpl instance', () {
      // Remove 'const' as BootstrapImpl does not have a const constructor
      expect(bootstrap, isA<Bootstrap>());
    });

    test('boot method should execute load methods', () async {
      final flag = await bootstrap.boot();

      // Add assertions based on the behavior of the `boot` method
      // For example, you can check the state of `bootstrap` after booting.
      // Since `_loadDecisionTree`, `_loadDefinitions`, and `_loadImplementingRules`
      // are private methods, their behavior should be indirectly tested via the
      // public `boot` method.
      // For example, you can set flags in the `BootstrapImpl` class to track
      // whether these methods were called during the `boot` method execution
      expect(flag, isTrue);
    });
  });
}

class NegativeTestBootstrap implements Bootstrap {
  const NegativeTestBootstrap();

  @override
  Future<bool> boot() {
    throw AssertionError();
  }
}
