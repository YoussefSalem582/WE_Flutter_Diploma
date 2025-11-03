//------------ Task 11.3 ------------   ColorApp

import 'package:flutter/material.dart';
import 'colorApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Colorapp(), // Start with the HomePage
    );
  }
}