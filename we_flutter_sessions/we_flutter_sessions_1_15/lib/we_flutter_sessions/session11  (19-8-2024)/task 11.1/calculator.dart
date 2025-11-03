import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';


class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = "0"; // To display the current input or result
  String input = ""; // To track the input string

  void onButtonPressed(String text) {
    setState(() {
      if (text == '=') {
        try {
          final expression = Expression.parse(input);
          final evaluator = const ExpressionEvaluator();
          final result = evaluator.eval(expression, {});
          displayText = result.toString();
        } catch (e) {
          displayText = "Error";
        }
        input = "";
      } else if (text == 'c') {
        displayText = "0";
        input = "";
      } else {
        if (input == "" && text == '.') {
          input = "0.";
        } else {
          input += text;
        }
        displayText = input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayText,
              style: TextStyle(fontSize: 70),
            ),

            SizedBox(height: 70),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btnCal(text: '1', event: () => onButtonPressed('1')),
                btnCal(text: '2', event: () => onButtonPressed('2')),
                btnCal(text: '3', event: () => onButtonPressed('3')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btnCal(text: '4', event: () => onButtonPressed('4')),
                btnCal(text: '5', event: () => onButtonPressed('5')),
                btnCal(text: '6', event: () => onButtonPressed('6')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btnCal(text: '7', event: () => onButtonPressed('7')),
                btnCal(text: '8', event: () => onButtonPressed('8')),
                btnCal(text: '9', event: () => onButtonPressed('9')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btnCal(text: '0', event: () => onButtonPressed('0')),
                btnCal(text: '+', c: Colors.black, event: () => onButtonPressed('+')),
                btnCal(text: '-', c: Colors.black,  event: () => onButtonPressed('-')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btnCal(text: 'x', c: Colors.black, event: () => onButtonPressed('*')),
                btnCal(text: '/', c: Colors.black, event: () => onButtonPressed('/')),
                btnCal(text: 'c', c: Colors.black, event: () => onButtonPressed('c')),

              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btnCal(text: '%', c: Colors.black, event: () => onButtonPressed('%')),
                btnCal(text: '.', c: Colors.black, event: () => onButtonPressed('.')),
                btnCal(text: '=', c: Colors.black, event: () => onButtonPressed('=')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}