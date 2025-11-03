//--------------------------------------------------  3  ----------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){

  runApp(FirstApp());
}

class FirstApp extends StatelessWidget
{
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
      ),
    );
  }
}

