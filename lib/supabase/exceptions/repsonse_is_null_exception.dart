// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231013223029
// 13.10.2023 22:30
import 'package:medical_device_classifier/supabase/exceptions/supabase_exception.dart';

class ResponseIsNullException extends SupabaseException {
  ResponseIsNullException({
    String msg = 'The response from the server is null!',
  }) : super(msg: msg);
}
