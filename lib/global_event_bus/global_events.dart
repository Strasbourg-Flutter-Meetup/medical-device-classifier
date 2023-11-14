// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231111174356
// 11.11.2023 17:43
/// An enumeration representing global events that can be published and
/// subscribed to on the global event bus.
enum GlobalEvent {
  /// Event to switch the application language to English.
  switchToEnglish,

  /// Event to switch the application language to French.
  switchToFrench,

  /// Event to switch the application language to German.
  switchToGerman,

  /// Event to hide the sticky note or informational message.
  hideStickyNote,

  /// Event to show the sticky note or informational message.
  showStickyNote, disableShowDisclaimerDialog,
}

