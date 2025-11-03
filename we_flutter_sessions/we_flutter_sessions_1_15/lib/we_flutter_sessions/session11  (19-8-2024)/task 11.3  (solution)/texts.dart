import 'package:flutter/material.dart';



Widget textColor
    ({
  required String t,
 required Color c,
  required Function() event
})=> TextButton(
    onPressed: event,
    child: Text(t,
        style: TextStyle(
            color: c,
            fontWeight: FontWeight.bold,
            fontSize: 30
        )
    ),

  );