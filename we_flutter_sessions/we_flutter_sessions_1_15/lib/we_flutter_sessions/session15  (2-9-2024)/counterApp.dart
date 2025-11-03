import 'package:flutter/material.dart';
import 'package:untitled/we_flutter_sessions/session11%20%20(19-8-2024)/task%2011.1/buttons.dart';

class Counterapp extends StatefulWidget {
  @override
  State<Counterapp> createState() => _CounterappState();
}

class _CounterappState extends State<Counterapp> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Counter App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                '$i',
                style: TextStyle(fontSize: 70),
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: btnCal(
                      text: '+',
                      event: () {
                        setState(() {
                          // Update state to rebuild the widget
                          i++;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: btnCal(
                      text: '-',
                      event: () {
                        setState(() {
                          i--;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: btnCal(
                      text: '=',
                      event: () {
                        // Add functionality for the '=' button if needed
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
