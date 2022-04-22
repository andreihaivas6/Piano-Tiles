// ignore_for_file: file_names, use_key_in_widget_constructors

import 'dart:async';
import 'package:app/pages/game/Board.dart';
import 'package:app/pages/game/GameInfo.dart';
import 'package:flutter/material.dart';

import 'package:app/pages/game/MyPainter.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GameState();
}

class GameState extends State<Game> {
  GameInfo info = GameInfo();
  Board board = Board(GameInfo());

  GameState() {
    board.info = info;
    Timer.periodic(
        const Duration(milliseconds: 16),
        (timer) => setState(() {
              info.move();
              if (info.gameOver) {
                timer.cancel();
              }
            }));
  }

  void handleTap(Offset pos) {
    info.onTap = true;
    info.pos = pos;
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
