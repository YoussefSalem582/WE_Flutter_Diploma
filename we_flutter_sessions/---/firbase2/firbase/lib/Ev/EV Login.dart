import 'package:firbase/Ev/firebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repeated/button.dart';
import 'EV SignUp.dart';
import 'EV home.dart';

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
              child: Image.asset("assets/images/image 1.png"),
            ),
          ),


          SizedBox(height: 0,),
          Center(
            child: Text('Please login to your',
              style: TextStyle(
                fontSize: 27,
                color: Colors.white, // Highlighted text color
                fontWeight: FontWeight.bold,
              ),),
          ),
          SizedBox(height: 50,),
          Center(
            child: Text(
              'Create new Charge Hub account',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white, // Highlighted text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text('Charge Hub account',
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
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: TextStyle(color: Colors.white), // Text color inside the field
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF2D2D2D), // Field background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.tealAccent), // Border color
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.tealAccent),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF2D2D2D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.tealAccent),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.tealAccent),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: btnCal(
              text: "Login",
              event: (){_Login;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MapScreen(); // This navigates to the home page
                  },
                ),
              );
                },
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
                  text: 'You do not have an account?',
                  style: TextStyle(
                    color: Color.fromRGBO(189, 189, 189, 1), // Main text color
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.tealAccent, // Underlined Login text
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
