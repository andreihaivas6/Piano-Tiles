import 'dart:async';
import 'dart:math';

import 'package:app/pages/game/MoveBoard.dart';
import 'package:app/pages/game/Tile.dart';
import 'package:flutter/material.dart';

class Board {
  static const int nrLines = 5, nrColumns = 4;

  MoveBoard move;

  late List<List<Tile>> tiles = List<List<Tile>>.empty(growable: true);

  Board(this.move) {
    initCanvas();
  }

  void initCanvas() {
    for (int i = 0; i < Board.nrLines; ++i) {
      List<Tile> line = [];
      for (int j = 0; j < Board.nrColumns; ++j) {
        line.add(Tile());
      }
      tiles.add(line);
    }

    int index = Random().nextInt(Board.nrColumns);
    tiles[Board.nrLines - 1][index].isToPressed = true;
  }

  void addNewLine() {
    for (int i = 0; i < Board.nrLines - 1; ++i) {
      tiles[i] = tiles[i + 1];
    }

    List<Tile> lastLine = [];
    for (int j = 0; j < Board.nrColumns; ++j) {
      lastLine.add(Tile());
    }

    int index = Random().nextInt(Board.nrColumns);
    lastLine[index].isToPressed = true;
    tiles[Board.nrLines - 1] = lastLine;
  }

  Tile getTileAtPos(Offset pos, Size size) {
    double tileWidth = size.width / Board.nrColumns;
    double tileHeight = size.height / (Board.nrLines - 1);

    int i = Board.nrLines -
        ((pos.dy + tileHeight - move.x) ~/ tileHeight) -
        (move.x == 0 ? 2 : 1);
    int j = pos.dx ~/ tileWidth;

    return tiles[i][j];
  }

  bool blackTileOnBottomLine() {
    for (int j = 0; j < Board.nrColumns; ++j) {
      if (tiles[0][j].isToPressed && !tiles[0][j].pressed) {
        return true;
      }
    }
    return false;
  }

  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < tiles.length; ++i) {
      for (int j = 0; j < tiles[i].length; ++j) {
        tiles[i][j].paint(canvas, size, i, j, move.x);
      }
    }
  }
}
