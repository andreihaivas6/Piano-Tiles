import 'package:flutter/material.dart';

class Utils {
  static void changePage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
