// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe

import 'package:app/objects/button.dart';
import 'package:app/objects/white_space.dart';
import 'package:app/pages/Game.dart';
import 'package:app/pages/Menu.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/ChangePage.dart';
import 'package:url_launcher/url_launcher.dart';

class EndGame extends StatelessWidget {
  int score;
  EndGame(this.score);

  shareOnFacebook() async {
    String testUrl = 'https://flutter.dev/';
    String text = 'Test share on Facebook with score: $score';
    String url =
        'https://www.facebook.com/sharer/sharer.php?u=$testUrl&quote=$text';

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Widget getBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Game Over',
            style: TextStyle(fontSize: 32),
          ),
          WhiteSpace.getWhiteSpace(0.1),
          Text('Score: $score', style: const TextStyle(fontSize: 28)),
          WhiteSpace.getWhiteSpace(0.8),
          ButtonFactory.getButton('Share on FB', shareOnFacebook,
              width: 0.4, height: 0.4),
          WhiteSpace.getWhiteSpace(0.2),
          ButtonFactory.getButton(
              'New Game', () => {ChangePage.change(context, Game())},
              width: 0.4, height: 0.4),
          WhiteSpace.getWhiteSpace(0.2),
          ButtonFactory.getButton(
              'Menu', () => {ChangePage.change(context, Menu())},
              width: 0.3, height: 0.4)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Piano Tiles',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('End Game')),
          ),
          body: getBody(context),
        ));
  }
}
