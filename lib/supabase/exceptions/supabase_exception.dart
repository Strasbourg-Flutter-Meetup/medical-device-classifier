// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012220344
// 12.10.2023 22:03
abstract class SupabaseException implements Exception {
  SupabaseException({required this.msg});

  final String msg;

  @override
  String toString() => msg;
}
