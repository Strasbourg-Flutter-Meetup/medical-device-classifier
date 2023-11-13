// Project: Medical Device Classifier
// Author: Daniel Krentzlin
// Project begin: 05.10.2023
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright: Strasbourg Flutter Meetup Group 2023
// ID: 20231027165223
// 27.10.2023 16:52
import 'package:medical_device_classifier/decision_tree/nodes/interfaces/node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/internal_node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/leaf_node.dart';
import 'package:medical_device_classifier/decision_tree/nodes/option.dart';
import 'package:medical_device_classifier/decision_tree/nodes/root_node.dart';

/// An abstract class representing a decision tree.
///
/// This class provides a framework for building decision trees. It defines
/// constants for key names used in decision tree data, allows you to store
/// a history of visited nodes, and provides methods for initializing the tree
/// and working with its nodes.
abstract class DecisionTree {
  /// Constant key for identifying root nodes in decision tree data.
  static const String isRootKey = 'isRoot';

  /// Constant key for identifying leaf nodes in decision tree data.
  static const String isLeafKey = 'isLeaf';

  /// Constant key for the unique identifier of a node.
  static const String idKey = 'id';

  /// Constant key for the decision text associated with a node.
  static const String decisionKey = 'decision';

  /// Constant key for the list of options associated with a node.
  static const String optionsKey = 'options';

  /// Constant key for the "when" condition in an option.
  static const String whenKey = 'when';

  /// Constant key for the "then" action in an option.
  static const String thenKey = 'then';

  /// Constant key for the result text associated with a leaf node.
  static const String resultKey = 'result';

  /// Constant key for providing hints or additional information about a node.
  static const String hintKey = 'hint';

  /// Constant key for providing detailed information about a node.
  static const String informationKey = 'information';

  /// A list to store the history of visited nodes.
  final List<Node> _history = <Node>[];

  /// A map to store the root nodes of the decision tree.
  final Map<String, RootNode> _rootNodes = <String, RootNode>{};

  /// A map to store all nodes in the decision tree.
  final Map<String, Node> _nodes = <String, Node>{};

  /// Adds a node to the history of visited nodes.
  ///
  /// This method records the traversal history of the decision tree by adding
  /// the specified [node] to the history list.
  void addNodeToHistory({required Node node}) {
    _history.add(node);
  }

  /// Gets a node by its identifier.
  ///
  /// This method retrieves a node from the decision tree based on its unique
  /// [id]. If the node does not exist, a default [LeafNode] is returned with
  /// empty values.
  Node getNode({required String id}) =>
      _nodes[id] ??
      LeafNode(
        id: '',
        result: '',
      );

  /// Gets the last visited node in the history.
  ///
  /// Returns the last visited node stored in the history of visited nodes.
  Node getLastNode() => _history.last;

  /// Clears the history of visited nodes.
  ///
  /// Removes all nodes from the history of visited nodes, effectively
  /// resetting it.
  void clearHistory() {
    _history.clear();
  }

  /// Restarts the decision tree from the root node.
  ///
  /// Clears the history of visited nodes and returns the root node of the
  /// decision tree, effectively restarting the decision-making process.
  Node restart() {
    clearHistory();
    final rootNode = _rootNodes.values.toList().first;
    _history.add(rootNode);

    return rootNode;
  }

  void clearTree() {
    _rootNodes.clear();
    _nodes.clear();
    clearHistory();
  }

  /// Gets the list of root nodes in the decision tree.
  ///
  /// This method returns a list of all root nodes present in the decision tree.
  List<Node> getRootNodes() => _rootNodes.values.toList();

  /// Removes the last visited node from the history.
  ///
  /// This method removes the most recently visited node from the traversal
  /// history, effectively stepping back in the decision tree.
  void removeLastNodeFromHistory() {
    _history.removeLast();
  }

  /// Initializes the decision tree with the provided data.
  ///
  /// This method initializes the decision tree using the provided [decisionTree]
  /// data. It parses the data to create nodes and options, building the tree's
  /// structure.
  void initialize({
    required List<Map<String, dynamic>> decisionTree,
  });

  /// Creates a map of options from a list of option data.
  ///
  /// This method takes a list of option data and converts it into a map of
  /// [Option] objects, where each option is associated with its unique identifier.
  Map<String, Option> createMapOfOptions({
    required List<Map<String, dynamic>> options,
  });
}

/// A concrete implementation of the [DecisionTree] class.
///
/// This class extends the [DecisionTree] class to provide a specific
/// implementation of decision tree initialization and option creation.
class DecisionTreeImpl extends DecisionTree {
  @override
  void initialize({
    required List<Map<String, dynamic>> decisionTree,
  }) {
    for (Map<String, dynamic> node in decisionTree) {
      if (node.containsKey(DecisionTree.isRootKey)) {
        _createRootNode(node);
        continue;
      }
      if (node.containsKey(DecisionTree.isLeafKey)) {
        _createLeafNode(node);
        continue;
      }

      _createInternalNode(node);
    }
  }

  /// Creates and adds an internal node to the decision tree based on the provided [node] data.
  ///
  /// This method is used during decision tree initialization to parse and create
  /// internal nodes with their associated properties.
  ///
  /// [node]: A map representing the internal node data.
  void _createInternalNode(Map<String, dynamic> node) {
    final id = node[DecisionTree.idKey] as String;
    final decision = node[DecisionTree.decisionKey] as String;
    final options = createMapOfOptions(
      options: (node[DecisionTree.optionsKey] as List).cast(),
    );

    final hint = node[DecisionTree.hintKey] as String?;
    final information = node[DecisionTree.informationKey] as String?;

    _nodes.putIfAbsent(
      id,
      () => InternalNode(
        id: id,
        decision: decision,
        options: options,
        hint: hint,
        information: information,
      ),
    );
  }

  /// Creates and adds a leaf node to the decision tree based on the provided [node] data.
  ///
  /// This method is used during decision tree initialization to parse and create
  /// leaf nodes with their associated properties.
  ///
  /// [node]: A map representing the leaf node data.
  void _createLeafNode(Map<String, dynamic> node) {
    final id = node[DecisionTree.idKey] as String;
    final result = node[DecisionTree.resultKey] as String;
    _nodes.putIfAbsent(id, () => LeafNode(id: id, result: result));
  }

  /// Creates and adds a root node to the decision tree based on the provided [node] data.
  ///
  /// This method is used during decision tree initialization to parse and create
  /// root nodes with their associated properties.
  ///
  /// [node]: A map representing the root node data.
  void _createRootNode(Map<String, dynamic> node) {
    final id = node[DecisionTree.idKey] as String;
    final decision = node[DecisionTree.decisionKey] as String;
    final options = createMapOfOptions(
      options: (node[DecisionTree.optionsKey] as List).cast(),
    );

    _rootNodes.putIfAbsent(
      id,
      () => RootNode(
        id: id,
        decision: decision,
        options: options,
      ),
    );
  }

  @override
  Map<String, Option> createMapOfOptions({
    required List<Map<String, dynamic>> options,
  }) {
    final output = <String, Option>{};

    for (Map<String, dynamic> option in options) {
      final id = option[DecisionTree.idKey];
      final when = option[DecisionTree.whenKey];
      final then = option[DecisionTree.thenKey];
      final optionObject = Option(
        id: id is String ? id : '',
        when: when is String ? when : '',
        then: then is String ? then : '',
      );

      output.putIfAbsent(
        id is String ? id : '',
        () => optionObject,
      );
    }

    return output;
  }
}
