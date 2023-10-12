// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012220011
// 12.10.2023 22:00

import 'package:flutter/foundation.dart';
import 'package:medical_device_classifier/supabase/exceptions/storage_download_exception.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';
import 'package:medical_device_classifier/supabase/supabase_repository.dart';

abstract class IStorageDownloadRepository extends BackendRepository {
  IStorageDownloadRepository({required super.supabaseClientImpl});

  Future<Uint8List?> download({
    required String bucketName,
    required String fileName,
  });
}

class StorageDownloadRepository extends IStorageDownloadRepository {
  StorageDownloadRepository({required SupabaseClientImpl supabaseClientImpl})
      : super(
          supabaseClientImpl: supabaseClientImpl,
        );

  @override
  Future<Uint8List?> download({
    required String bucketName,
    required String fileName,
  }) async {
    final response =
        await supabaseClient?.storage.from(bucketName).download(fileName);

    if (response == null) {
      throw StorageDownloadException(msg: 'Download response is null!');
    }

    return response;
  }
}
