// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231011130200
// 11.10.2023 13:02
import 'package:flutter/material.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) => const BottomAppBar(
        color: Colors.amberAccent,
        child: SizedBox(
          child: Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Legal Notice"),
                  Text("Privacy Protection"),
                ],
              ),
            ),
          ),
        ),
      );
}
