// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231012134743
// 12.10.2023 13:47
import 'package:medical_device_classifier/state_management/states.dart';
import 'package:test/test.dart';

void main() {
  group('StateTemplate', () {
    test('props should return a list containing type and data', () {
      const state = StateTemplate<int>.initialized(data: 42);
      expect(state, equals(const InitializedRequestState<int>(data: 42)));
      expect(state.props, equals([42]));
    });

    test('props should return a list containing type and null data', () {
      const state = StateTemplate<int>.initialized();
      expect(state, equals(const InitializedRequestState<int>()));
      expect(state.props, equals([null]));
    });

    test('props should return a list containing type and previousData', () {
      const state = StateTemplate<int>.loading(previousData: 42);
      expect(state, equals(const LoadingRequestState<int>(previousData: 42)));
      expect(state.props, equals([42]));
    });

    test('props should return a list containing type and null previousData',
        () {
      const state = StateTemplate<int>.loading();
      expect(state, equals(const LoadingRequestState<int>()));
      expect(state.props, equals([null]));
    });

    test('props should return a list containing type and data', () {
      const state = StateTemplate<int>.loaded(data: 42);
      expect(state, equals(const LoadedRequestState<int>(data: 42)));
      expect(state.props, equals([42]));
    });

    test('props should return a list containing type and null data', () {
      const state = StateTemplate<int>.loaded(data: null);
      expect(state, equals(const LoadedRequestState<int>()));
      expect(state.props, equals([null]));
    });

    test('props should return a list for initial state', () {
      const state = StateTemplate<int>.initial();
      expect(state, equals(const InitialRequestState<int>()));
      expect(state.props, equals([null]));
    });

    test('props should return a list for error state', () {
      const state = StateTemplate<int>.error();
      expect(state, equals(const ErrorRequestState<int>()));
      expect(state.props, equals([null]));
    });
  });
}
