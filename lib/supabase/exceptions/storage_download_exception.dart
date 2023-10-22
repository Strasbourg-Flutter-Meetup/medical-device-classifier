// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012220415
// 12.10.2023 22:04
import 'package:medical_device_classifier/supabase/exceptions/supabase_exception.dart';

class StorageDownloadException extends SupabaseException {
  StorageDownloadException({required String msg}) : super(msg: msg);
}
