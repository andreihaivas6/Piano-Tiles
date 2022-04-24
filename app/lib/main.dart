// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'pages/Menu.dart';

// WhiteTile - The game consists of a grid in which there are white/black tiles coming from
// the top of the screen to the bottom with an increasing speed. The goal of the game is to
// touch only the black tiles(which should make a sound). Menu with highscores, share on
// facebook, new game.

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano Tiles',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Menu(),
    );
  }
}
