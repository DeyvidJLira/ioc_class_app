import 'package:flutter/material.dart';
import 'package:ioc_class_app/navigator_key.dart';
import 'package:ioc_class_app/strings.dart';

class ProgressDialog {
  bool _isShowing = false;

  void show() {
    if (_isShowing) return;
    _isShowing = true;
    showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.green,
              content: SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      Strings.LABEL_PROCESSING,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ));
  }

  void hide() {
    if (!_isShowing) return;
    _isShowing = false;
    navigatorKey.currentState!.pop();
  }
}
