// ignore_for_file: file_names

import 'package:app/pages/EndGame.dart';
import 'package:app/pages/game/Board.dart';
import 'package:app/pages/game/GameInfo.dart';
import 'package:app/pages/game/Tile.dart';
import 'package:app/persistance/Persistance.dart';
import 'package:app/utils/PlaySoundOnTap.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/ChangePage.dart';

class MyPainter extends CustomPainter {
  BuildContext context;

  Board board;
  GameInfo info;
  Persistance persistance = Persistance();

  MyPainter(this.board, this.context) : info = board.info;

  @override
  void paint(Canvas canvas, Size size) {
    board.paint(canvas, size);

    gameLogic(size);

    paintScore(canvas, size);
  }

  void gameLogic(Size size) {
    if (info.onTap) {
      info.onTap = false;
      Tile pressedTile = board.getTileAtPos(info.pos, size);

      if (pressedTile.isToPressed && !pressedTile.pressed) {
        PlaySoundOnTap.play();
        info.increaseScore();
        info.increaseSpeed();
        pressedTile.pressed = true;
      } else {
        endGame();
      }
    }

    if (info.x >= (size.height / (Board.nrLines - 1))) {
      info.x %= (size.height / (Board.nrLines - 1));
      board.addNewLine();
      if (board.blackTileOnBottomLine()) {
        endGame();
      }
    }
  }

  void endGame() {
    info.gameOver = true;
    PlaySoundOnTap.playGameOver();

    persistance.writeScore(info.score);

    Future.delayed(Duration.zero, () {
      ChangePage.change(context, EndGame(info.score));
    });
  }

  void paintScore(Canvas canvas, Size size) {
    var textPainter = TextPainter(
      text: TextSpan(
        text: '${info.score}',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 32,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    textPainter.paint(
        canvas,
        Offset((size.width - textPainter.width) / 2,
            (size.height - textPainter.height) * 0.05));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
