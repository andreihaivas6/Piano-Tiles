import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'button.dart';
import 'white_space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget getBody() {
    return Center(
        child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 1,
            child: Column(
              children: [
                ButtonFactory.getButton('Play game', () => {}),
                WhiteSpace.getWhiteSpace(0.5),
                ButtonFactory.getButton('Highscores', () => {}),
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
