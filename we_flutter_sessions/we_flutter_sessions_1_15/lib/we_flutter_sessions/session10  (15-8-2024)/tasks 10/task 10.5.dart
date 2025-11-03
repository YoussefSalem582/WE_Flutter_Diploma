//-------------------------------------------------------------------------------   5   -------------------------------------------------
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
  String text1 = 'one', text2 = 'two';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('WE App',
              style: TextStyle(color: Colors.white
              ),
            ),
            // centerTitle: true,

            leading: IconButton(
                onPressed: (){
                  print('Hello');
                },
                icon: Icon(Icons.account_circle_sharp, color: Colors.white)
            ),

            actions: [
              InkWell(
                child: Icon(Icons.favorite, color: Colors.white),
                onTap: (){
                  print('fav.');
                },
              ),

              SizedBox(
                width: 10,
              ),

              InkWell(
                child: Icon(Icons.shopping_cart, color: Colors.white),
                onTap: (){
                  print('cart.');
                },
              ),

            ],
          ),


          body: Container(
            height: double.infinity,
            color: Colors.grey,

            child: Column(
              children: [

                SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(text1, style: TextStyle(
                        fontSize: 40
                    ),
                    ),
                    Text(text2, style: TextStyle(
                        fontSize: 40
                    ),
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                MaterialButton(onPressed: (){
                  text1 = 'two';
                  text2 = 'one';
                  setState(() {

                  });
                },
                  color: Colors.deepPurple,
                  child: Text('Result',
                    style: TextStyle(
                        fontSize: 40
                    ),
                  ),
                )
              ],

            ),
          )
      ),
    );
  }
}
