import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(ElearningApp());
}

class ElearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingHomePage(),
    );
  }
}
