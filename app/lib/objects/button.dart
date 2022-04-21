import 'package:flutter/material.dart';

class ButtonFactory {
  static Widget getButton(String text, VoidCallback function,
      {double width = 0.7, double height = 0.6}) {
    return Flexible(
        child: FractionallySizedBox(
            widthFactor: width,
            heightFactor: height,
            child: ElevatedButton(
              child: Text(text),
              onPressed: function,
            )));
  }
}
