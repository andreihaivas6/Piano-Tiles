// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Highscore extends StatelessWidget {
  Widget getBody() {
    return Container();
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
            title: const Center(child: Text('Highscore')),
          ),
          body: getBody(),
        ));
  }
}
