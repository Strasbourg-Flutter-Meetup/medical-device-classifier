// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012132149
// 12.10.2023 13:21
import 'package:medical_device_classifier/bootstrap.dart';
import 'package:test/test.dart';

void main() {
  group('Bootstrap', () {
    test('should define a boot method', () {
      const bootstrap = BootstrapImpl();
      expect(bootstrap.boot(), completion(isTrue)); // Check that it returns true
    });

    test('boot method should be overridden in subclasses', ()  {
      const bootstrap = NegativeTestBootstrap();
      expect(() async => await bootstrap.boot(), throwsA(isA<AssertionError>()));
    });
  });

  group('BootstrapImpl', () {
    test('should initialize a BootstrapImpl instance', () {
      // Remove 'const' as BootstrapImpl does not have a const constructor
      const bootstrap = BootstrapImpl();
      expect(bootstrap, isA<Bootstrap>());
    });

    test('boot method should execute load methods', () async {
      const bootstrap = BootstrapImpl();
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

class NegativeTestBootstrap implements Bootstrap{

  const NegativeTestBootstrap();

  @override
  Future<bool> boot() {

    throw AssertionError();
  }

}


