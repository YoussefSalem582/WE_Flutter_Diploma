//-------------------------------------------------------------------------------------     7   ------------------------------------------------   calculator

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){

  runApp(FirstApp());
}

class FirstApp extends StatefulWidget {
  @override
  State<FirstApp> createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
  int counter = 0;

  void plus() {
    setState(() {
      counter++;
    });
  }

  void negative() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Calculator',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$counter',
                style: TextStyle(fontSize: 70),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '6',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '9',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '*',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '/',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      'c',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {});
                    },
                    color: Colors.deepPurple,
                    child: Text(
                      '=',
                      style: TextStyle(fontSize: 40),
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
