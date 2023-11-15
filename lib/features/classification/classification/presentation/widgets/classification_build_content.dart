// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231030140122
// 30.10.2023 14:01

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_classifier/decision_tree/nodes/interfaces/decision_node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/interfaces/node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/internal_node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/leaf_node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/option.dart';
import 'package:medical_device_classifier/decision_tree/nodes/root_node.dart';
import 'package:medical_device_classifier/extensions/app_localization_extension.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/cubits/classification_cubit.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/cubits/classification_state.dart';
import 'package:medical_device_classifier/features/classification/classification/presentation/widgets/result.dart';
import 'package:medical_device_classifier/routing/router.dart';
import 'package:medical_device_classifier/ui/ui_constants.dart';
import 'package:medical_device_classifier/ui/widgets/listtile_button.dart';

/// A widget representing the content of the Classification screen.
class ClassificationBuildContent extends StatelessWidget {
  const ClassificationBuildContent({
    super.key,
    required this.data,
  });

  final ClassificationStateData data;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClassificationCubit>();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: UIConstants.maxWidthHalf),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ..._getNodeWidgets(
              data.currentNode,
              cubit,
              context,
            ),
            const SizedBox(
              height: 12.0,
            ),
            if (data.currentNode is! RootNode)
              ElevatedButton(
                onPressed: () {
                  cubit.goBack();
                },
                child: Text(context.appLocalizations?.classificationBack ?? ''),
              ),
            const SizedBox(
              height: 48.0,
            ),
            if (data.currentNode is! RootNode)
              ElevatedButton(
                onPressed: () {
                  cubit.restart();
                },
                child: Text(
                  context.appLocalizations?.classificationRestart ?? '',
                ),
              ),
            if (data.currentNode is! RootNode)
              const SizedBox(
                height: 12.0,
              ),
            ElevatedButton(
              onPressed: goToHome,
              child: Text(
                context.appLocalizations?.classificationCancel ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getNodeWidgets(
    Node currentNode,
    ClassificationCubit cubit,
    BuildContext context,
  ) {
    final output = <Widget>[];

    if (currentNode is LeafNode) {
      _handleLeafNode(currentNode, output);
    }

    if (currentNode is DecisionNode) {
      final decision = currentNode.decision;
      _handleDecision(output, decision);

      if (currentNode is RootNode) {
        _handleRootNode(currentNode, output, cubit);
      }

      if (currentNode is InternalNode) {
        if (currentNode.information != null) {
          _handleInternalNodeInformation(output, context, currentNode);
        }
        if (currentNode.hint != null) {
          _handleInternalNodeHint(output, context, currentNode);
        }

        for (Option option in currentNode.options.values.toList()) {
          _handleInternalNodeOptions(option, output, cubit);
        }
      }
    }

    return output;
  }

  void _handleInternalNodeOptions(
    Option option,
    List<Widget> output,
    ClassificationCubit cubit,
  ) {
    final when = option.when;
    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(when),
        const SizedBox(
          height: 12.0,
        ),
      ],
    );

    output.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTileButton(
          title: title,
          onTap: () {
            cubit.goForward(id: option.then);
          },
        ),
      ),
    );
  }

  void _handleInternalNodeHint(
    List<Widget> output,
    BuildContext context,
    InternalNode currentNode,
  ) {
    output.add(
      ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.warning_outlined,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(context.appLocalizations?.classificationHint ?? ''),
          ],
        ),
        children: [
          Text(
            currentNode.hint ?? '',
          ),
        ],
      ),
    );
  }

  void _handleInternalNodeInformation(
    List<Widget> output,
    BuildContext context,
    InternalNode currentNode,
  ) {
    output.add(
      ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.info_outlined,
              color: Colors.lightBlueAccent,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              context.appLocalizations?.classificationInformation ?? '',
            ),
          ],
        ),
        children: [
          Text(
            currentNode.information ?? '',
          ),
        ],
      ),
    );
  }

  void _handleRootNode(
    RootNode currentNode,
    List<Widget> output,
    ClassificationCubit cubit,
  ) {
    for (Option option in currentNode.options.values.toList()) {
      output.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ListTileButton(
            title: Text(option.when),
            onTap: () {
              cubit.goForward(
                id: option.then,
              );
            },
          ),
        ),
      );
    }
  }

  void _handleDecision(List<Widget> output, String decision) {
    output.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(decision),
      ),
    );
  }

  void _handleLeafNode(LeafNode currentNode, List<Widget> output) {
    final values = currentNode.result.split(',');
    final rule = values[1].trim();
    final classification = values[0].trim();
    output.add(
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Result(rule: rule, classification: classification),
      ),
    );
  }
}
