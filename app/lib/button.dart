import 'package:flutter/material.dart';

class ButtonFactory {
  static Widget getButton(String text, VoidCallback function) {
    return Flexible(
        child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.6,
            child: ElevatedButton(
              child: Text(text),
              onPressed: function,
            )));
  }
}
