import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget ColorText(
        {required String t, required Color c, required Function() event}) =>
    TextButton(
        onPressed: event,
        child: Text(
          t,
          style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 60),
        ));
