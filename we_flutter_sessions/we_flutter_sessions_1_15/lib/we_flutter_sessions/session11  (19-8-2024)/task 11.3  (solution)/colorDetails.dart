import 'package:flutter/material.dart';




class ColorDetails extends StatelessWidget {
 late Color c;
  late String text;
  ColorDetails(this.text,this.c);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:this.c ,
      body: Center(child: Text(this.text)),
    );
  }
}
