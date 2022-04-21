import 'package:flutter/material.dart';

class MoveBoard {
  static const double increaseSpeedvalue = 1;
  static const int thresholdToIncreaseSpeed = 10;

  double x = 0;
  double addX = 3;
  int score = 0;

  bool onTap = false;
  late Offset pos;

  bool gameOver = false;

  void increaseSpeed() {
    if (score != 0 && score % MoveBoard.thresholdToIncreaseSpeed == 0) {
      addX += MoveBoard.increaseSpeedvalue;
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
