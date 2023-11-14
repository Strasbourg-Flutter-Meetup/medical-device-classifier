// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011210923
// 11.10.2023 21:09
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/bootstrap.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:medical_device_classifier/global_event_bus/global_event_bus.dart';
import 'package:medical_device_classifier/global_event_bus/global_events.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

/// The [DashboardCubit] class is part of the Flutter `Bloc` architecture and represents the business logic
/// for managing the state of the dashboard screen in the Medical Device Classifier application.

class DashboardCubit extends Cubit<DashboardState> {
  /// Constructor for the [DashboardCubit] class.
  ///
  /// [initialState] is the initial state of the dashboard.
  /// [bootstrap] is a required parameter representing the bootstrap logic for initializing the dashboard.

  DashboardCubit(
    super.initialState, {
    required this.bootstrap,
    required this.sharedPreferencesRepository,
    required this.globalEventBus,
  });

  /// An instance of [Bootstrap] used for initializing the dashboard.
  final Bootstrap bootstrap;

  final SharedPreferencesRepository sharedPreferencesRepository;

  final GlobalEventBus globalEventBus;

  /// Private field to store the state data associated with the dashboard.
  DashboardStateData? _stateData;

  bool _showDisclaimerDialog = false;

  StreamSubscription<GlobalEvent>? _globalEventBusStreamSubscription;

  /// Method to initialize the dashboard and check legal notice confirmation.
  ///
  /// This method sets the state to [DashboardState.loading], triggers the bootstrap process,
  /// checks the user's legal notice confirmation status, and updates the state data.
  /// It then transitions to [DashboardState.loaded] when initialization is complete.
  ///
  /// If an error occurs during initialization, it emits a [DashboardState.error] state.
  Future<void> initialize() async {
    try {
      emit(const DashboardState.loading());
      await bootstrap.boot();

      // Check the user's legal notice confirmation status from SharedPreferences.
      final legalNoticeConfirmationState = sharedPreferencesRepository.read(
        key: SharedPreferencesKeys.legalNoticeConfirmation,
      );

      // Determine whether to show the legal notice disclaimer dialog.
      _showDisclaimerDialog = legalNoticeConfirmationState == 'false' ||
          legalNoticeConfirmationState.isEmpty;

      _updateStateData();
      emit(DashboardState.loaded(data: _stateData));
    } catch (e) {
      emit(
        const DashboardState.error(),
      );
    }
  }

  Future<void> cancelGlobalEventBusStreamSubscription() async {
    await _globalEventBusStreamSubscription?.cancel();
  }

  void listenToGlobalEventBus() {
    _globalEventBusStreamSubscription = globalEventBus.eventBus
        .where((event) => event == GlobalEvent.disableShowDisclaimerDialog)
        .listen((event) {
      emit(const DashboardState.loading());
      _showDisclaimerDialog = false;
      _updateStateData();
      emit(DashboardState.loaded(data: _stateData));
    });
  }

  /// Private method to update the state data for the dashboard.
  ///
  /// This method creates a new instance of [DashboardStateData] and assigns it to the [_stateData] field.

  void _updateStateData() {
    _stateData = DashboardStateData(
      showDisclaimerDialog: _showDisclaimerDialog,
    );
  }
}
