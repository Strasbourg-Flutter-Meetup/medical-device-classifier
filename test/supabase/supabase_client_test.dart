// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012204908
// 12.10.2023 20:49
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_device_classifier/supabase/supabase_client.dart';
import 'package:medical_device_classifier/supabase/supabase_wrapper.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_client_test.mocks.dart'; // Import Mockito for mocking.

// Create a mock for the Supabase client.

@GenerateNiceMocks([
  MockSpec<SupabaseClient>(),
  MockSpec<SupabaseWrapper>(),
])
void main() {
  group('SupabaseClientImpl', () {
    test('initialize() should set up supabaseClient', () async {
      // Arrange
      final mockSupabaseClient = MockSupabaseClient();
      final mockSupabaseWrapper = MockSupabaseWrapper();
      final supabaseClientImpl = SupabaseClientImpl.instance
        ..setSupabaseWrapper(mockSupabaseWrapper);

      // Mock the Supabase.initialize method to return the mock client.
      when(
        mockSupabaseWrapper.initialize(
          supabaseURL: 'https://test.com',
          supabaseAnonKey: 'abc',
        ),
      ).thenAnswer(
        (_) async => mockSupabaseClient,
      );

      // Act
      await supabaseClientImpl.initialize(
        supabaseURL: 'https://test.com',
        supabaseAnonKey: 'abc',
      );

      // Assert
      expect(supabaseClientImpl.supabaseClient, equals(mockSupabaseClient));
    });
  });
}
