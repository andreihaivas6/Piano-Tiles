import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GameState();
}

class GameState extends State<Game> {
  Widget getBody() {
    return const Center(
        child: Text(
      'ceva',
      style: TextStyle(fontSize: 40),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano Tiles',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: getBody(),
      ),
    );
  }
}
