// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231016133631
// 16.10.2023 13:36
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/features/general_explanation_of_rules/presentation/cubits/general_explanation_of_rules_state.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_keys.dart';
import 'package:medical_device_classifier/shared_preferences/shared_preferences_repository.dart';

class GeneralExplanationOfRulesCubit
    extends Cubit<GeneralExplanationOfRulesState> {
  GeneralExplanationOfRulesCubit(
    super.initialState, {
    required this.leoMLDocumentParser,
    required this.sharedPreferencesRepository,
  });

  LeoMLDocumentParser leoMLDocumentParser;
  SharedPreferencesRepository sharedPreferencesRepository;

  GeneralExplanationOfRulesStateData? _stateData;

  Widget _columnOfExpansionTiles = const Placeholder();

  Future<void> initialize() async {
    emit(const GeneralExplanationOfRulesState.loading());

    final template = ExpansionTile1(
      headerBuilder: MyCustomHeaderBuilder(),
      contentBuilder: MyCustomContentBuilder(),
      customExpansionTile: CustomExpansionTileBuilder(),
    );
    final leoMLDocument = sharedPreferencesRepository.read(
      key: SharedPreferencesKeys.rules,
    );

    _columnOfExpansionTiles = await leoMLDocumentParser.parseToColumn(
      leoMLDocument: leoMLDocument,
      template: template,
    );

    _updateStateData();

    emit(GeneralExplanationOfRulesState.loaded(data: _stateData));
  }

  void _updateStateData() {
    _stateData = GeneralExplanationOfRulesStateData(
      column: _columnOfExpansionTiles,
    );
  }
}

class MyCustomHeaderBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomHeader(object: object)..validateObject();
}

class MyCustomHeader extends StatelessWidgetTemplate {
  const MyCustomHeader({super.key, required super.object});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            object[header][headline] as String,
            style: TextStyle(fontSize: 20),
          ),
          if ((object[header] as Map).containsKey(subHeadline))
            Text(
              object[header][subHeadline] as String,
              style: TextStyle(fontSize: 16),
            ),
        ],
      );

  @override
  void validateObject() {
    if (object[header][headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: '$header --> $headline',
      );
    }

    if ((object[header] is Map) &&
        (object[header] as Map).containsKey(subHeadline) &&
        object[header][headline] is! String) {
      throw AtomicObjectIsNotStringException(
        subTagName: '$header --> $subHeadline',
      );
    }
  }
}

class MyCustomContentBuilder extends LeoMLWidgetBuilder {
  @override
  Widget build({required Map<String, dynamic> object}) =>
      MyCustomContent(object: object)..validateObject();
}

/// A widget that represents a header.
class MyCustomContent extends StatelessWidgetTemplate {
  /// Creates a [MyCustomContent] widget.
  ///
  /// The [MyCustomContent] parameter specifies the text of the
  /// header.
  const MyCustomContent({
    super.key,
    required super.object,
  });

  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];

    final contentList = object[content] as List;

    for (Map<String, dynamic> map in contentList.cast()) {
      Widget widget = const Placeholder();

      switch (map.keys.first) {
        case section:
          widget = Text(
            map[section] as String,
            style: TextStyle(fontSize: 12),
          );
          break;
        case sectionHeadline:
          widget = Text(
            map[sectionHeadline] as String,
            style: TextStyle(fontSize: 14),
          );
          break;
        case paragraphHeadline:
          widget = Text(
            map[paragraphHeadline] as String,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          );
          break;
        case paragraph:
          widget = Text(
            map[paragraph] as String,
            style: TextStyle(fontSize: 10),
          );
          break;
        case image:
          widget = Column(
            children: [
              Image.network(
                map['image']['imageURL'] as String,
              ),
              if ((object[content]['image'] as Map)
                  .containsKey('imageDescription'))
                Column(
                  children: [
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      map['image']['imageDescription'] as String,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
            ],
          );
          ;
          break;
        case citation:
          widget = Text(
            map[paragraph] as String,
            style: TextStyle(fontSize: 12),
          );
          break;
        case list:
          widget = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getTextWidgets(
              map,
              'list',
            ),
          );
          break;
        default:
          widget = const Placeholder();
      }

      widgetList.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: widget,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }

  @override
  void validateObject() {}

  List<Widget> getTextWidgets(Map<String, dynamic> object, String key) {
    final output = <Widget>[];

    final list = object[key] as List;

    for (String text in list.cast()) {
      final widget = Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          top: 3.0,
        ),
        child: Text(
          '\u2022 $text',
          style: TextStyle(fontSize: 12),
        ),
      );

      output.add(widget);
    }

    return output;
  }
}

class CustomExpansionTileBuilder extends CustomWidgetBuilder {
  @override
  Widget build({required Widget header, required Widget content}) =>
      CustomExpansionTile(header: header, content: content);
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.header,
    required this.content,
  });

  final Widget header;
  final Widget content;

  @override
  Widget build(BuildContext context) => ExpansionTile(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.amber),
        ),
        collapsedShape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.amber),
        ),
        title: header,
        children: [
          content,
        ],
      );
}
