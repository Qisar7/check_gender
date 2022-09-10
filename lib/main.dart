import 'package:flutter/material.dart';
import 'package:malefmale/homepage.dart';

void main() {
  runApp(
    MyHome(),
  );
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade800,
        ),
      ),
    );
  }
}
