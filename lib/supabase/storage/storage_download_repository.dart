// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012220011
// 12.10.2023 22:00

import 'package:flutter/foundation.dart';
import 'package:medical_device_classifier/supabase/backend_repository.dart';
import 'package:medical_device_classifier/supabase/exceptions/repsonse_is_null_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// An abstract class representing a storage download repository.
///
/// This abstract class extends [BackendRepository] and provides a contract for
/// downloading files from a storage bucket using Supabase.
abstract class IStorageDownloadRepository extends BackendRepository {
  /// Creates an [IStorageDownloadRepository] with the provided [supabaseClientImpl].
  IStorageDownloadRepository({required super.supabaseClientImpl});

  /// Downloads a file from the specified storage bucket.
  ///
  /// The [bucketName] parameter represents the name of the storage bucket.
  /// The [fileName] parameter is the name of the file to download.
  ///
  /// Throws a [ResponseIsNullException] if the download response is null.
  Future<Uint8List?> download({
    required String bucketName,
    required String fileName,
  });
}

/// A concrete implementation of the [IStorageDownloadRepository] interface.
///
/// This class provides functionality to download files from a storage bucket using Supabase.
class StorageDownloadRepository extends IStorageDownloadRepository {
  /// Creates a [StorageDownloadRepository] with the provided [supabaseClientImpl].
  StorageDownloadRepository({required super.supabaseClientImpl});

  @override
  Future<Uint8List?> download({
    required String bucketName,
    required String fileName,
  }) async {
    final response =
        await supabaseClient?.storage.from(bucketName).download(fileName);

    if (responseIsNull(response)) {
      throw ResponseIsNullException();
    } else {
      return response;
    }
  }
}
