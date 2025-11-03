import 'package:firbase/Ev/firebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repeated/button.dart';
import 'EV SignUp.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _SignUpState();
}

class _SignUpState extends State<Login> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  var _emailController = TextEditingController();


  var _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 49, 48, 1), // Dark background
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [

          SizedBox(height: 20,),


          Container(
            width: 300,  // Set your desired width
            height: 300, // Set your desired height
            child: FittedBox(
              fit: BoxFit.cover,  // Use BoxFit.fill or other options if needed
              child: Image.asset("assets/images/image 1.png",height: 2,width: 40,),
            ),
          ),


          SizedBox(height: 0,),
          Center(
            child: Text('Login to ChargeHub',
              style: TextStyle(
                fontSize: 27,
                color: Colors.white, // Highlighted text color
                fontWeight: FontWeight.bold,
              ),),
          ),
          SizedBox(height: 50,),
          Center(
            child: Text(
              'Create new ChargeHub account',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white, // Highlighted text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text('ChargeHub account',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white, // Highlighted text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 50,),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              style: TextStyle(color: Colors.white), // Text color inside the field
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Field background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.tealAccent), // Border color
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.red),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 40),
            child: btnCal(c: Colors.black,
              text: "Login",
              event: _Login,
              // Dark text on light button
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp(); // This navigates to the Login page
                    },
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'New here ?',
                  style: TextStyle(
                    color: Color.fromRGBO(189, 189, 189, 1), // Main text color
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign Up',
                      style: TextStyle(
                        color: Color.fromRGBO(189, 189, 189, 1), // Main text color
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void _Login()async{
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =await _auth.signInWithEmailAndPassword(email, password);
    if(user!=null){
      print('user enrolled');
    } else
      {
        print('error');
      }
  }
}
