import 'package:flutter/material.dart';
import 'package:ioc_class_app/navigator_key.dart';

class InputDialog {
  bool _isShowing = false;

  final String titleText;
  final String hintText;
  final String buttonText;
  Function(int value) onClick;

  final textFieldController = TextEditingController();

  InputDialog(
      {required this.titleText,
      required this.hintText,
      required this.buttonText,
      required this.onClick});

  show() {
    if (_isShowing) return;
    _isShowing = true;
    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text(titleText),
              content: TextField(
                controller: textFieldController,
                autofocus: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: InputDecoration(hintText: hintText),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      onClick(int.parse(textFieldController.text));
                      hide();
                    },
                    child: Text(buttonText))
              ],
            ));
  }

  void hide() {
    if (!_isShowing) return;
    _isShowing = false;
    navigatorKey.currentState!.pop();
  }
}
