import 'package:flutter/material.dart';
import 'package:ovvo/screens/input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ovvo App',
      home: InputScreen(),
    );
  }
}