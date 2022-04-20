import 'package:app/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Game.dart';
import 'Highscore.dart';
import '../objects/button.dart';
import '../objects/white_space.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MenuState();
}

class MenuState extends State<Menu> {
  Widget getBody() {
    return Center(
        child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 1,
            child: Column(
              children: [
                ButtonFactory.getButton(
                    'Play game', () => {Utils.changePage(context, Game())}),
                WhiteSpace.getWhiteSpace(0.5),
                ButtonFactory.getButton('Highscores',
                    () => {Utils.changePage(context, Highscore())}),
                WhiteSpace.getWhiteSpace(1),
                WhiteSpace.getWhiteSpace(1),
                ButtonFactory.getButton(
                    'Exit game', () => {SystemNavigator.pop()}),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )));
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
            title: const Center(child: Text('Piano Tiles')),
          ),
          body: getBody(),
        ));
  }
}
