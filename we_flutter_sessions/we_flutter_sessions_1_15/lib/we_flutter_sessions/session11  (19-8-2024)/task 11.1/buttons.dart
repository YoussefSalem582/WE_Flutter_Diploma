import 'package:flutter/material.dart';


Widget btnCal
    ({
  required String text,
  required Function() event,
  Color c = Colors.deepPurple
})
{
  return MaterialButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25)
    ),

    minWidth: 120,
    height: 80,

    color: c,
    onPressed: event,
    child: Text(text,
    style: TextStyle(
      fontSize: 40,
      color: Colors.white

    ),
    ),
  );
}
