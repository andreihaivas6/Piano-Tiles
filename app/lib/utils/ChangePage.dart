// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChangePage {
  static void change(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
