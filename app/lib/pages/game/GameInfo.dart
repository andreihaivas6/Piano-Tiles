// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GameInfo {
  static const double increaseSpeedvalue = 1;
  static const int thresholdToIncreaseSpeed = 10;

  double x = 0;
  double addX = 5;
  int score = 0;

  bool onTap = false;
  late Offset pos;

  bool gameOver = false;

  void increaseSpeed() {
    if (score > 0 &&
        score < 100 &&
        score % GameInfo.thresholdToIncreaseSpeed == 0) {
      addX += GameInfo.increaseSpeedvalue;
    }
  }

  void move() {
    x += addX;
  }

  void increaseScore() {
    score++;
  }

  @override
  String toString() {
    return 'Move board: x: $x, speed: $addX';
  }
}
