// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012135808
// 12.10.2023 13:58
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/bootstrap.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:mockito/annotations.dart';

import '../../../../bootstrap_test.mocks.dart';
import 'dashboard_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BootstrapImpl>()])
void main() {
  group('DashboardCubit', () {
    late DashboardCubit dashboardCubit;
    final mockBootstrap = MockBootstrapImpl();
    final mockSharedPreferencesRepository = MockSharedPreferencesRepository();

    setUp(() {
      dashboardCubit = DashboardCubit(
        const DashboardState.initial(),
        bootstrap: mockBootstrap,
        sharedPreferencesRepository: mockSharedPreferencesRepository,
        globalEventBus: GlobalEventBus.instance,
      );
    });

    tearDown(() {
      dashboardCubit.close();
    });

    blocTest<DashboardCubit, DashboardState>(
      'emits loading and loaded states when initialize is called',
      build: () => dashboardCubit,
      act: (cubit) {
        cubit.initialize();
      },
      expect: () => [
        // Verify that it emits a loading state.
        equals(const DashboardState.loading()),

        // Verify that it emits a loaded state.
        equals(
          const DashboardState.loaded(
            data: DashboardStateData(
              showDisclaimerDialog: true,
            ),
          ),
        ),
      ],
    );

    blocTest<DashboardCubit, DashboardState>(
      'initializes the dashboard data when initialize is called',
      build: () => dashboardCubit,
      act: (cubit) {
        cubit.initialize();
      },
      verify: (cubit) {
        // Verify that the dashboard data is initialized.
        expect(
          cubit.state,
          equals(
            const DashboardState.loaded(
              data: DashboardStateData(
                showDisclaimerDialog: true,
              ),
            ),
          ),
        );
        final loadedStateData = cubit.state.data;
        expect(loadedStateData, isA<DashboardStateData>());
      },
    );

    // Add more test cases as needed.
  });
}
