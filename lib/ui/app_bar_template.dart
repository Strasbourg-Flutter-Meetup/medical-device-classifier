// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011132712
// 11.10.2023 13:27
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// The [AppBarTemplate] widget is a Flutter [StatelessWidget] that represents
/// the custom AppBar used throughout the application. It provides the
/// application's title and an optional back button or navigation icon.
class AppBarTemplate extends StatelessWidget implements PreferredSizeWidget {
  /// Constructor for the [AppBarTemplate] widget.
  ///
  /// [isDashboard] is an optional parameter that indicates whether this
  /// AppBar is being used in the dashboard view. If true, it displays an
  /// account tree icon; otherwise, it shows a back button (on mobile).
  ///
  /// [key] is an optional parameter that can be used to provide a key for
  /// this widget.
  const AppBarTemplate({
    super.key,
    this.isDashboard = false,

  });

  /// Indicates whether this AppBar is being used in the dashboard view.
  final bool isDashboard;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Display either a back button (on mobile) or an account tree icon.
      leading: !kIsWeb && !isDashboard
          ? const BackButton()
          : const Icon(Icons.account_tree_outlined),

      // The title of the AppBar, retrieved from the app's localizations or
      // providing a default title if not found.
      title: Text(
        AppLocalizations.of(context)?.appBarTitle ??
            'Medical Device Identifier',
      ),
    );
  }
}

