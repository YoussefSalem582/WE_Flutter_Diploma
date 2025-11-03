//------------------------------------------    6    ------------------------------------------    counter app

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){

  runApp(FirstApp());
}

class FirstApp extends StatefulWidget
{
  @override
  State<FirstApp> createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
  int counter = 0;

  void plus(){
    setState(() {
      counter++;
    });
  }

  void negative(){
    setState(() {
      if(counter>0) {
        counter--;
      }
    }
    );
  }

  void reset(){
    setState(() {
      counter =0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Counter',
            style: TextStyle(color: Colors.white
            ),
          ),
          centerTitle: true,
        ),


        body: Container(
          height: double.infinity,
          color: Colors.grey,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter',
                style: TextStyle(
                    fontSize: 70
                ),
              ),

              SizedBox(height: 100),

              Text('$counter',
                style: TextStyle(fontSize: 50),
              ),

              SizedBox(height: 200),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(onPressed: (){
                    setState(() {
                      plus();
                    }
                    );
                  },
                    color: Colors.deepPurple,
                    child: Text('+',
                      style: TextStyle(
                          fontSize: 40
                      ),
                    ),
                  ),

                  MaterialButton(onPressed: (){
                    setState(() {
                      negative();
                    }
                    );
                  },
                    color: Colors.deepPurple,
                    child: Text('-',
                      style: TextStyle(
                          fontSize: 40
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),

              MaterialButton(onPressed: (){
                setState(() {
                  reset();
                }
                );
              },
                color: Colors.deepPurple,
                child: Text('Reset',
                  style: TextStyle(
                      fontSize: 40
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

