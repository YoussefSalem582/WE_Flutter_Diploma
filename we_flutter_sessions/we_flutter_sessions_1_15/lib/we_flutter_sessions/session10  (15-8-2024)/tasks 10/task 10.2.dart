//---------------------------------------------------   2   ---------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){

  runApp(FirstApp());
}

class FirstApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}