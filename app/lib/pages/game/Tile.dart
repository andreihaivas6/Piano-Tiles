// ignore_for_file: file_names

import 'package:app/pages/game/Board.dart';
import 'package:flutter/material.dart';

class Tile {
  bool isToPressed = false;
  bool pressed = false;

  void paint(Canvas canvas, Size size, int i, int j, double x) {
    int nrLines = Board.nrLines - 1;
    int ii = Board.nrLines - i - 2;

    Color strokeColor = isToPressed && !pressed ? Colors.white : Colors.black;
    var paint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke;

    canvas.drawRect(
        Offset(size.width * j / Board.nrColumns,
                size.height * ii / nrLines + x) &
            Size(size.width / Board.nrColumns, size.height / nrLines),
        paint);

    if (isToPressed && !pressed) {
      paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill;

      canvas.drawRect(
          Offset(size.width * j / Board.nrColumns,
                  size.height * ii / nrLines + x) &
              Size(size.width / Board.nrColumns, size.height / nrLines),
          paint);
    }
  }
}
