import 'package:flutter/material.dart';
import 'package:planoclock/screen0.dart';
import 'package:planoclock/screen2.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() {
  runApp(planoclock());
}

class planoclock extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme:
            AppBarTheme(backgroundColor: Color(0xFFb33a6b), titleSpacing: 15),
        primaryColor: Color(0xFFd6a0d6),
      ),
      home: S1(),
    );
  }
}
