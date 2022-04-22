// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';

class PlaySoundOnTap {
  static AudioCache player = AudioCache();
  static const tapPath = "sound1.mp3";
  static const gameOverPath = 'game_over.mp3';

  static void play() {
    player.play(tapPath);
  }

  static void playGameOver() {
    player.play(gameOverPath);
  }
}
