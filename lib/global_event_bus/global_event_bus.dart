// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231111174406
// 11.11.2023 17:44
import 'dart:async';

import 'package:medical_device_classifier/global_event_bus/global_events.dart';

/// The [GlobalEventBus] class provides a simple event bus mechanism for
/// broadcasting and listening to global events in the application.
class GlobalEventBus {
  GlobalEventBus._();

  /// A singleton instance of the [GlobalEventBus] class.
  static final GlobalEventBus instance = GlobalEventBus._();

  /// A stream controller used for broadcasting events.
  final StreamController<GlobalEvent> _eventBus = StreamController.broadcast();

  /// Returns a stream that allows subscribers to listen to events.
  Stream<GlobalEvent> get eventBus => _eventBus.stream;

  /// Adds a [GlobalEvent] to the event bus, broadcasting it to all listeners.
  ///
  /// [event] is the global event to be added to the bus.
  void addEvent(GlobalEvent event) {
    _eventBus.add(event);
  }

  /// Closes the event bus stream when it's no longer needed.
  ///
  /// This should be called to release resources and prevent memory leaks.
  Future<void> disposeEventBus() async {
    await _eventBus.close();
  }
}
