import 'package:flutter/material.dart';
import 'colorDetails.dart';
import 'colorText.dart';

class Colorapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ColorText(
                t: 'Green',
                c: Colors.green,
                event: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (c) {
                      return ColorDetails(Colors.green, 'Green');
                    }),
                  );
                },
              ),
              ColorText(
                t: 'Red',
                c: Colors.red,
                event: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (c) {
                      return ColorDetails(Colors.red, 'Red');
                    }),
                  );
                },
              ),
              ColorText(
                t: 'Blue',
                c: Colors.blue,
                event: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (c) {
                      return ColorDetails(Colors.blue, 'Blue');
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
