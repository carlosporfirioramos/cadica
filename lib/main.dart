import 'package:cadica/UI/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadica',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}