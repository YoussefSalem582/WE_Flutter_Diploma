import 'package:firbase/Ev/EV%20Login.dart';
import 'package:firbase/Ev/firebaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repeated/button.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  var _usernameController = TextEditingController();

  var _emailController = TextEditingController();


  var _passwordController = TextEditingController();

  @override
  void dispose(){
    _usernameController.dispose();
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


          Center(
            child: Text('Sign Up to Charge Hub',
              style: TextStyle(
              fontSize: 27,
              color: Colors.white, // Highlighted text color
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(height: 10,),
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
            child: Text('and join the family!',
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
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF2D2D2D), // Field background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.tealAccent), // Border color
                ),
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.tealAccent),
              ),
            ),
          ),
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
              text: "Sign Up",
              event: _signUp,
              // Dark text on light button
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Login(); // This navigates to the Login page
                    },
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'Do you have an existing account? ',
                  style: TextStyle(
                    color: Color.fromRGBO(189, 189, 189, 1), // Main text color
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: Colors.tealAccent, // Underlined Login text
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String username = _usernameController.text.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up Successful')),
      );
      // Navigate to the next screen or perform other actions
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Enter a valid email and password')),
      );
    }
  }
}
