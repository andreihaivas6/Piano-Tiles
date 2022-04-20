import 'package:flutter/material.dart';

import 'pages/Menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  int page = 0;

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
