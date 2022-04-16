import 'package:flutter/material.dart';

class WhiteSpace {
  static Widget getWhiteSpace(double value) {
    return Flexible(
      child: FractionallySizedBox(
        heightFactor: value,
      ),
    );
  }
}
