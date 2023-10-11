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

class AppBarTemplate extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTemplate({
    this.isDashboard = false,
    super.key,
  });

  final bool isDashboard;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !kIsWeb && !isDashboard
          ? const BackButton()
          : const Icon(Icons.account_tree_outlined),
      title: Text(
        AppLocalizations.of(context)?.appBarTitle ??
            'Medical Device Identifier',
      ),
    );
  }
}
