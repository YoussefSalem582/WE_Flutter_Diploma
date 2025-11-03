import 'package:flutter/material.dart';


Widget btnCal
    ({
  required String text,
  required Function() event,
  Color c=Colors.lightGreenAccent
    })
=> MaterialButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25)
    ),

    onPressed: event,
    child: Text(text,
      style: TextStyle(
      fontSize: 30,
        fontWeight: FontWeight.w200,
    ),),
    color: c,
  );
