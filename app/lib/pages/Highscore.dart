// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:app/objects/white_space.dart';
import 'package:app/pages/Menu.dart';
import 'package:app/persistance/Persistance.dart';
import 'package:app/utils/ChangePage.dart';
import 'package:flutter/material.dart';

class Highscore extends StatelessWidget {
  Widget getBody(BuildContext context) {
    return FutureBuilder(
      future: Persistance().readHighscores(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return getHighscores(snapshot.data, context);
        } else {
          return Container();
        }
      },
    );
  }

  Widget getHighscores(dynamic highscores, BuildContext context) {
    List<Widget> children = [];

    children.add(
        Text('Date${" " * 20}Score', style: const TextStyle(fontSize: 27)));
    children.add(WhiteSpace.getWhiteSpace(0.5));

    for (Map data in highscores) {
      String separator = "." * (20 - data["score"].toString().length * 2);
      String text = '${data["date"]}$separator${data["score"]}';

      children.add(Text(text, style: const TextStyle(fontSize: 18)));
      children.add(WhiteSpace.getWhiteSpace(0.1));
    }

    children.add(WhiteSpace.getWhiteSpace(0.5));
    children.add(ElevatedButton(
        child: const Text('Back to Menu'),
        onPressed: () => ChangePage.change(
              context,
              Menu(),
            )));

    return Center(
      child: Column(
        children: children,
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
              title: const Center(child: Text('Highscores')),
            ),
            body: getBody(context)));
  }
}
