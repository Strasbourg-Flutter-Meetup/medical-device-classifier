// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011200350
// 11.10.2023 20:03

import 'package:equatable/equatable.dart';

/// [StateTemplate<T>] represents a sealed class hierarchy for different states in an application,
/// allowing for type-safe usage of these states. It extends [Equatable] for deep equality comparisons.
/// Generics are used to allow any type of data to be associated with a state.
sealed class StateTemplate<T> extends Equatable {
  /// Optional data of type [T].
  final T? data;

  /// Constructor for [StateTemplate], taking optional [data].
  const StateTemplate({this.data});

  /// Factory constructor for creating an initial state.
  const factory StateTemplate.initial() = InitialRequestState<T>;

  /// Factory constructor for creating an initialized state with optional [data].
  const factory StateTemplate.initialized({T? data}) =
      InitializedRequestState<T>;

  /// Factory constructor for creating a loading state with optional [previousData].
  const factory StateTemplate.loading({T? previousData}) =
      LoadingRequestState<T>;

  /// Factory constructor for creating a loaded state with required [data].
  const factory StateTemplate.loaded({required T? data}) =
      LoadedRequestState<T>;

  /// Factory constructor for creating an error state.
  const factory StateTemplate.error() = ErrorRequestState<T>;

  /// Overrides [props] from [Equatable] to ensure objects are compared based on their [data].
  @override
  List<Object?> get props => [data];
}

/// Represents the initial state, typically indicating that a request or process has not started.
class InitialRequestState<T> extends StateTemplate<T> {
  const InitialRequestState();
}

/// Represents an initialized state, indicating that a request or process is set up but not yet in progress.
class InitializedRequestState<T> extends StateTemplate<T> {
  const InitializedRequestState({super.data});
}

/// Represents a loading state, indicating that a request or process is currently in progress.
/// Optionally holds [previousData], the data before the process started.
class LoadingRequestState<T> extends StateTemplate<T> {
  const LoadingRequestState({T? previousData}) : super(data: previousData);
}

/// Represents a loaded state, indicating that a request or process has completed successfully.
/// Holds [data], the result of the process.
class LoadedRequestState<T> extends StateTemplate<T> {
  const LoadedRequestState({super.data});
}

/// Represents an error state, indicating that a request or process has failed.
class ErrorRequestState<T> extends StateTemplate<T> {
  const ErrorRequestState() : super();
}
