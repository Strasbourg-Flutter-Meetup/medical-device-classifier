// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011210923
// 11.10.2023 21:09
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/bootstrap.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/dashboard_state.dart';

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
  });

  /// An instance of [Bootstrap] used for initializing the dashboard.
  Bootstrap bootstrap;

  /// Private field to store the state data associated with the dashboard.
  DashboardStateData? _stateData;

  /// Method to initialize the dashboard.
  ///
  /// This method sets the state to [DashboardState.loading], triggers the bootstrap process,
  /// updates the state data, and then transitions to [DashboardState.loaded] when initialization is complete.
  ///
  /// If an error occurs during initialization, it emits a [DashboardState.error] state.
  Future<void> initialize() async {
    try {
      emit(const DashboardState.loading());
      await bootstrap.boot();
      _updateStateData();
      emit(DashboardState.loaded(data: _stateData));
    } catch (e) {
      emit(
        const DashboardState.error(),
      );
    }
  }


  /// Private method to update the state data for the dashboard.
  ///
  /// This method creates a new instance of [DashboardStateData] and assigns it to the [_stateData] field.

  void _updateStateData() {
    _stateData = const DashboardStateData();
  }
}
