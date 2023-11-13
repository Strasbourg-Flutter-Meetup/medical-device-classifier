// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231113105826
// 13.11.2023 10:58
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/dependency_injection/injections.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/features/dashboard/presentation/cubit/sticky_note_cubit.dart';
import 'package:medical_device_classifier/ui/widgets/sticky_note.dart';
/// A widget representing a sticky note displayed on the dashboard.
class DashboardStickyNote extends StatelessWidget {
  /// Creates a [DashboardStickyNote] widget.
  const DashboardStickyNote({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<StickyNoteCubit>(
    create: (context) => getIt.get<StickyNoteCubit>()..initialize(),
    child: _StickyNoteContent(),
  );
}

/// The content of the sticky note displayed on the dashboard.
class _StickyNoteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<StickyNoteCubit>().state.data;

    if (data == null) {
      return Container();
    }

    if (!data.showStickyNote) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: StickyNote(
        content: Text(
          context.appLocalizations?.dashboardStickyNoteTranslationNoteText ??
              '',
          style: const TextStyle(
            fontSize: 12.0,
          ),
        ),
        title:
        context.appLocalizations?.dashboardStickyNoteTranslationTitle ?? '',
        type: StickyNoteMessageType.information,
      ),
    );
  }
}
