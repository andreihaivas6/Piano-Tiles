import 'dart:async';
// import 'package:app/pages/game/Board.dart';
import 'package:app/pages/game/Board.dart';
import 'package:app/pages/game/MoveBoard.dart';
import 'package:flutter/material.dart';

import 'package:app/pages/game/MyPainter.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GameState();
}

class GameState extends State<Game> {
  MoveBoard move = MoveBoard();
  Board board = Board(MoveBoard());

  GameState() {
    board.move = move;
    Timer.periodic(
        const Duration(milliseconds: 16),
        (timer) => setState(() {
              move.move();
              if (move.gameOver) {
                timer.cancel();
              }
            }));
  }

  void handleTap(Offset pos) {
    move.onTap = true;
    move.pos = pos;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano Tiles',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: GestureDetector(
            onTapDown: (details) => {handleTap(details.localPosition)},
            child: AbsorbPointer(
                child: CustomPaint(
              painter: MyPainter(board, context),
              child: Container(),
            ))),
      ),
    );
  }
}
