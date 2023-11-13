// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2023
// ID: 20231111104020
// 11.11.2023 10:40
import 'package:flutter/material.dart';

/// The [StickyNoteMessageType] enum represents different types of sticky note messages.
enum StickyNoteMessageType {
  /// Informational message type.
  information,

  /// Warning message type.
  warning,

  /// Error message type.
  error,
}

/// A widget representing a sticky note with a title, content, and optional action buttons.
class StickyNote extends StatelessWidget {
  /// Creates a [StickyNote] widget.
  const StickyNote({
    super.key,
    this.actionButtons,
    required this.content,
    required this.title,
    required this.type,
  });

  /// Optional action buttons to include in the sticky note.
  final List<Widget>? actionButtons;

  /// The title of the sticky note.
  final String title;

  /// The content of the sticky note.
  final Widget content;

  /// The type of sticky note message.
  final StickyNoteMessageType type;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _getBackgroundColor().withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _StickyNoteTitle(title: title, type: type),
            _StickyNoteContent(content: content),
            _StickyNoteActionButtons(actionButtons: actionButtons),
          ],
        ),
      );

  Color _getBackgroundColor() {
    switch (type) {
      case StickyNoteMessageType.warning:
        return Colors.yellow;
      case StickyNoteMessageType.error:
        return Colors.redAccent;
      default:
        return Colors.lightBlueAccent;
    }
  }
}

class _StickyNoteActionButtons extends StatelessWidget {
  const _StickyNoteActionButtons({
    this.actionButtons,
  });

  final List<Widget>? actionButtons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6.0,
        left: 12.0,
        bottom: 12.0,
        right: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actionButtons ?? [],
      ),
    );
  }
}

class _StickyNoteContent extends StatelessWidget {
  const _StickyNoteContent({
    required this.content,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: content,
    );
  }
}

class _StickyNoteTitle extends StatelessWidget {
  const _StickyNoteTitle({
    required this.title,
    required this.type,
  });

  final String title;
  final StickyNoteMessageType type;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: 12.0,
          bottom: 6.0,
        ),
        child: Row(
          children: [
            _getTypeIcon(),
            const SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      );

  Icon _getTypeIcon() {
    switch (type) {
      case StickyNoteMessageType.warning:
        return const Icon(
          Icons.warning,
          color: Colors.yellow,
        );
      case StickyNoteMessageType.error:
        return const Icon(
          Icons.error,
          color: Colors.redAccent,
        );
      default:
        return const Icon(
          Icons.info,
          color: Colors.lightBlueAccent,
        );
    }
  }
}
