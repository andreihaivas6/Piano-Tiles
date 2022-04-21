import 'package:app/pages/EndGame.dart';
import 'package:app/pages/game/Board.dart';
import 'package:app/pages/game/MoveBoard.dart';
import 'package:app/pages/game/Tile.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/Utils.dart';

class MyPainter extends CustomPainter {
  MoveBoard move;
  Board board;
  BuildContext context;

  MyPainter(this.board, this.context) : move = board.move;

  void endGame() {
    move.gameOver = true;
    storeScore(move.score);
    Future.delayed(Duration.zero, () {
      Utils.changePage(context, EndGame(move.score));
    });
  }

  void storeScore(int score) {}

  @override
  void paint(Canvas canvas, Size size) {
    board.paint(canvas, size);

    if (move.onTap) {
      move.onTap = false;
      Tile pressedTile = board.getTileAtPos(move.pos, size);

      if (pressedTile.isToPressed && !pressedTile.pressed) {
        move.increaseScore();
        move.increaseSpeed();
        pressedTile.pressed = true;
      } else {
        endGame();
      }
    }

    if (move.x >= (size.height / (Board.nrLines - 1))) {
      move.x = 0;
      board.addNewLine();
      if (board.blackTileOnBottomLine()) {
        endGame();
      }
    }

    paintScore(canvas, size);
  }

  void paintScore(Canvas canvas, Size size) {
    var textPainter = TextPainter(
      text: TextSpan(
        text: '${move.score}',
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
