import 'package:flutter/material.dart';

mixin CoreViewModelBase on ChangeNotifier {
  BuildContext? context;

  setViewModelContext(BuildContext context) {
    this.context = context;
  }

  final List<TextEditingController> _textEditingControllers =
      <TextEditingController>[];
  final List<FocusNode> _focusNodes = <FocusNode>[];

  TextEditingController getTextEditingController({String? text}) {
    final controller = TextEditingController(text: text);
    _textEditingControllers.add(controller);
    return controller;
  }

  FocusNode getFocusNode({
    String? debugLabel,
    KeyEventResult Function(FocusNode, RawKeyEvent)? onKey,
    KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent,
    bool skipTraversal = false,
    bool canRequestFocus = true,
    bool descendantsAreFocusable = true,
    bool descendantsAreTraversable = true,
  }) {
    final focusNode = FocusNode(
      debugLabel: debugLabel,
      onKey: onKey,
      onKeyEvent: onKeyEvent,
      skipTraversal: skipTraversal,
      canRequestFocus: canRequestFocus,
      descendantsAreFocusable: descendantsAreFocusable,
      descendantsAreTraversable: descendantsAreTraversable,
    );
    _focusNodes.add(focusNode);
    return focusNode;
  }

  Future<void> initialise() async {}

  void _disposeTextEditingController(TextEditingController controller) {
    controller.dispose();
  }

  void _disposeFocusNode(FocusNode focusNode) {
    focusNode.dispose();
  }

  @override
  void dispose() {
    _textEditingControllers.forEach(_disposeTextEditingController);
    _focusNodes.forEach(_disposeFocusNode);
    super.dispose();
  }
}
