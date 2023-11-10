// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231021143816
// 21.10.2023 14:38
import 'package:leoml_parser/leoml_parser.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/dependency_injection/injections/injection_configuration.dart';
import 'package:medical_device_classifier/leoml/leoml_builder/citation_builder.dart';
import 'package:medical_device_classifier/leoml/leoml_builder/expansion_tile_builder.dart';
import 'package:medical_device_classifier/leoml/leoml_builder/expansion_tile_content_builder.dart';
import 'package:medical_device_classifier/leoml/leoml_builder/expansion_tile_header_builder.dart';
import 'package:medical_device_classifier/leoml/leoml_builder/headline_builder.dart';
import 'package:medical_device_classifier/leoml/leoml_builder/list_builder.dart';
import 'package:medical_device_classifier/leoml/leoml_builder/section_builder.dart';

/// A configuration class responsible for configuring dependency injections using GetIt.
///
/// The [InjectionLeoML] class extends [InjectionConfiguration] and is responsible
/// for configuring dependency injections using the GetIt library.
class InjectionLeoML extends InjectionConfiguration {
  @override
  // ignore: long-method
  void configureGetItInjections() {
    // Register factories for builders.
    getIt.registerFactory<ExpansionTileContentBuilder>(
      () => ExpansionTileContentBuilder(),
    );
    getIt.registerFactory<ExpansionTileHeaderBuilder>(
      () => ExpansionTileHeaderBuilder(),
    );
    getIt.registerFactory<ExpansionTileBuilder>(
      () => ExpansionTileBuilder(),
    );

    getIt.registerFactory<HeadlineBuilder>(
      () => HeadlineBuilder(),
    );

    getIt.registerFactory<CitationBuilder>(
      () => CitationBuilder(),
    );
    getIt.registerFactory<SectionBuilder>(
      () => SectionBuilder(),
    );

    getIt.registerFactory<ListBuilder>(
      () => ListBuilder(),
    );

    // Register a factory for the custom ExpansionTile widget.
    getIt.registerFactory<ExpansionTile1>(
      () => ExpansionTile1(
        contentBuilder: getIt.get<ExpansionTileContentBuilder>(),
        headerBuilder: getIt.get<ExpansionTileHeaderBuilder>(),
        customExpansionTile: getIt.get<ExpansionTileBuilder>(),
        headlineBuilder: getIt.get<HeadlineBuilder>(),
        citationBuilder: getIt.get<CitationBuilder>(),
        sectionBuilder: getIt.get<SectionBuilder>(),
      ),
    );

    // Register a factory for the custom ExpansionTile widget.
    getIt.registerFactory<Article>(
      () => Article(
        headlineBuilder: getIt.get<HeadlineBuilder>(),
        citationBuilder: getIt.get<CitationBuilder>(),
        sectionBuilder: getIt.get<SectionBuilder>(),
        listBuilder: getIt.get<ListBuilder>(),
      ),
    );
  }
}
