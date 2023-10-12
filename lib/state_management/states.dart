// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011200350
// 11.10.2023 20:03
import 'package:equatable/equatable.dart';

/// The [StateTemplateType] enum defines a set of distinct states that a generic
/// state template can represent within an application. These states are used to
/// capture different scenarios or conditions that can occur during the
/// application's lifecycle.

/// The possible states defined by this enum include:
/// 1. [initial]: This state typically represents the initial state of an entity
///     or component. It signifies a starting point before any specific data or
///     content is loaded or displayed.

/// 2. [initialized]: This state indicates that an entity or component has been
///     initialized and is ready for further actions. It may contain optional
///     data that has been set during initialization.

/// 3. [loading]: This state represents a state of activity where data
///     is being fetched, processed, or loaded. It is often used to provide
///     feedback to users that an operation is in progress.

/// 4. [loaded]: This state signifies a successful completion of a loading
///      or data retrieval operation. It usually includes the loaded data and
///      indicates that the component is now ready to display it.

/// 5. [error]: This state indicates that an error or exception has occurred.
///     It is used to handle and communicate error conditions to the user.

/// These states serve as a foundation for managing the behavior and appearance
/// of components within an application, allowing developers to respond
/// appropriately to different situations and provide a smooth user experience.
enum StateTemplateType {
  initial,
  initialized,
  loading,
  loaded,
  error,
}

/// The [StateTemplate] class is a versatile generic class that serves as a
/// representation of a state within an application. It is designed to work with
/// a specific data type [T] and extends the [Equatable] class, which simplifies
/// equality checks and comparisons.

/// Constructor for the [StateTemplate] class:
/// - [type]: This is a required parameter that indicates the type of the state.
///     It is an essential identifier for the state instance.
/// - [data]: This is an optional parameter that can hold data of type [T].
///     It allows you to associate relevant data with the state.

/// Factory Constructors:
/// - [StateTemplate.initial()]: This factory constructor creates an instance
///     of the [initial] state, which typically represents the starting point or
///     initial condition. It doesn't contain any data.
/// - [StateTemplate.initialized({T? data})]: This factory constructor generates
///     an [initialized] state, indicating that an entity or component has been
///     initialized. It may include optional [data] if needed.
/// - [StateTemplate.loading({T? previousData})]: Use this factory constructor
///     to create a [loading] state, signifying that an operation is in
///     progress. It can optionally carry [previousData] for reference.
/// - [StateTemplate.loaded({required T? data})]: This factory constructor
///     represents a [loaded] state, indicating the successful completion
///     of an operation. It requires [data] to be provided.
/// - [StateTemplate.error()]: The [error] factory constructor creates an
///     instance of the [error] state, which is used to communicate error
///     conditions.

/// Supported State Types:
/// - [initial]: Represents the initial state, often used as a starting point.
/// - [initialized]: Indicates that an entity or component has been initialized.
/// - [loading]: Signifies that an operation is in progress.
/// - [loaded]: Represents a state where an operation has been successfully
///     completed, and [data] is provided.
/// - [error]: Indicates an error condition.

/// Properties:
/// - [type]: This property stores the type of the state, which is crucial for identifying and categorizing different states.
/// - [data]: This property holds data of type [T], providing context or information associated with the state.

/// Equatable:
/// - The [StateTemplate] class extends [Equatable], allowing for easy comparison of state objects. It automatically generates equality checks for the [type] and [data] properties.

/// This class is fundamental for managing and communicating the state of components and entities within an application, enabling developers to represent a wide range of conditions and scenarios efficiently.
class StateTemplate<T> extends Equatable {
  const StateTemplate(this.type, {this.data});

  const factory StateTemplate.initial() = _InitialRequestState<T>;

  const factory StateTemplate.initialized({T? data}) =
      _InitializedRequestState<T>;

  const factory StateTemplate.loading({T? previousData}) =
      _LoadingRequestState<T>;

  const factory StateTemplate.loaded({required T? data}) =
      _LoadedRequestState<T>;

  const factory StateTemplate.error() = _ErrorRequestState<T>;

  final StateTemplateType type;

  final T? data;

  @override
  List<Object?> get props => [type, data];
}

/// Private class representing the [initial] state.
///
/// The [_InitialRequestState] class is a private implementation that extends
/// [StateTemplate] and represents the [initial] state. This state is typically
/// used as a starting point or initial condition, indicating that no specific
/// operation has occurred. It does not contain any additional data.

class _InitialRequestState<T> extends StateTemplate<T> {
  const _InitialRequestState() : super(StateTemplateType.initial);
}

/// Private class representing the [initialized] state with optional [data].
///
/// The [_InitializedRequestState] class is a private implementation that
/// extends [StateTemplate] and represents the [initialized] state.
/// This state is used to indicate that an entity or component has been
/// initialized successfully. It can optionally include [data],
/// which provides additional context or information associated with
/// the initialization.

class _InitializedRequestState<T> extends StateTemplate<T> {
  const _InitializedRequestState({T? data})
      : super(StateTemplateType.initialized, data: data);
}

/// Private class representing the [loading] state with optional [previousData].
///
/// The [_LoadingRequestState] class is a private implementation that extends
/// [StateTemplate] and represents the [loading] state. This state indicates
/// that an operation is currently in progress. It can optionally carry
/// [previousData], which may reference data from a previous state.

class _LoadingRequestState<T> extends StateTemplate<T> {
  const _LoadingRequestState({T? previousData})
      : super(StateTemplateType.loading, data: previousData);
}

/// Private class representing the [loaded] state with required [data].
///
/// The [_LoadedRequestState] class is a private implementation that extends
/// [StateTemplate] and represents the [loaded] state. This state signifies that
/// an operation has been successfully completed. It requires [data], which
/// should be provided to convey the result of the operation.

class _LoadedRequestState<T> extends StateTemplate<T> {
  const _LoadedRequestState({required T? data})
      : super(StateTemplateType.loaded, data: data);
}

/// Private class representing the [error] state.
///
/// The [_ErrorRequestState] class is a private implementation that extends
/// [StateTemplate] and represents the [error] state. This state is used to
/// indicate an error condition, typically resulting from a failed operation
/// or unexpected situation. It does not include any additional data.

class _ErrorRequestState<T> extends StateTemplate<T> {
  const _ErrorRequestState() : super(StateTemplateType.error);
}
