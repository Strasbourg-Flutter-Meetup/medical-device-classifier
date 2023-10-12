// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012222804
// 12.10.2023 22:28
import 'package:medical_device_classifier/supabase/exceptions/supabase_exception.dart';

class DatabaseFetchDataException extends SupabaseException {
  DatabaseFetchDataException({required String msg}) : super(msg: msg);
}