// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012221534
// 12.10.2023 22:15
// ignore_for_file: inference_failure_on_function_invocation

import 'package:medical_device_classifier/supabase/backend_repository.dart';
import 'package:medical_device_classifier/supabase/exceptions/repsonse_is_null_exception.dart';

/// An abstract class representing a data repository for fetching data from a database.
///
/// This abstract class extends [BackendRepository] and provides a contract for
/// retrieving data from a database using Supabase.
abstract class IDatabaseFetchDataRepository extends BackendRepository {
  /// Creates an [IDatabaseFetchDataRepository] with the provided [supabaseClientImpl].
  IDatabaseFetchDataRepository({required super.supabaseClientImpl});

  /// Fetches data from the database based on the specified [tableName], [query], and [columns].
  ///
  /// The [tableName] parameter represents the name of the database table to fetch data from.
  ///
  /// The [query] parameter is an optional map of filtering criteria to apply to the query.
  ///
  /// The [columns] parameter specifies the columns to retrieve (default is '*').
  ///
  /// Throws a [ResponseIsNullException] if the response from the database is null.
  Future<Object?> fetchData({
    required String tableName,
    Map<String, dynamic>? query,
    String columns = '*',
  });
}

/// A concrete implementation of the [IDatabaseFetchDataRepository] interface.
///
/// This class provides functionality to fetch data from a database using Supabase.
class DatabaseFetchDataRepository extends IDatabaseFetchDataRepository {
  /// Creates a [DatabaseFetchDataRepository] with the provided [supabaseClientImpl].
  DatabaseFetchDataRepository({required super.supabaseClientImpl});

  @override
  Future<Object?> fetchData({
    required String tableName,
    Map<String, dynamic>? query,
    String columns = '*',
  }) async {
    Object? response;

    if (query != null) {
      response =
          await supabaseClient?.from(tableName).select(columns).match(query);
    } else {
      response = await supabaseClient?.from(tableName).select(columns);
    }

    if (responseIsNull(response)) {
      throw ResponseIsNullException();
    } else {
      return response;
    }
  }
}
