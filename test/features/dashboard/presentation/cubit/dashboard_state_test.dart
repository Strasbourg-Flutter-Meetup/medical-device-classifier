// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012142041
// 12.10.2023 14:20
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:test/test.dart';

void main() {
  group('DashboardState', () {
    test('creates an instance of DashboardStateData', () {
      // Create a DashboardState instance.
      const dashboardState =
          DashboardState.loaded(data: DashboardStateData());

      // Verify that the associated data is of type DashboardStateData.
      expect(dashboardState.data, isA<DashboardStateData>());
    });

    test('creates an instance of DashboardStateData with copyWith', () {
      // Create a DashboardStateData instance.
      const originalData = DashboardStateData();

      // Create a copy of DashboardStateData using copyWith.
      final copiedData = originalData.copyWith();

      // Verify that the copiedData is also of type DashboardStateData.
      expect(copiedData, isA<DashboardStateData>());
    });

    test('compares DashboardState instances', () {
      // Create two instances of DashboardState with the same data.
      const state1 = DashboardState.initial();
      const state2 = DashboardState.initial();

      // Verify that the two instances are equal.
      expect(state1, equals(state2));
    });

    test('compares DashboardStateData instances', () {
      // Create two instances of DashboardStateData.
      const data1 = DashboardStateData();
      const data2 = DashboardStateData();

      // Verify that the two instances are equal.
      expect(data1, equals(data2));
    });

    test('checks equality of DashboardState instances using Equatable', () {
      // Create two instances of DashboardState with different data.
      const state1 = DashboardState.initial();
      const state2 = DashboardState.loaded(data: DashboardStateData());

      // Verify that Equatable checks correctly.
      expect(state1, isNot(equals(state2)));
    });

    test('checks equality of DashboardStateData instances using Equatable', () {
      // Create two instances of DashboardStateData with different properties.
      const data1 = DashboardStateData();
      const data2 = DashboardStateData();

      // Verify that Equatable checks correctly.
      expect(data1, equals(data2));
    });
  });
}
