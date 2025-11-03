import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repeated/button.dart'; // Assuming this is a custom button widget
import 'SignUp.dart'; // Sign-up screen
import 'mapScreen.dart'; // Home screen after login

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 49, 48, 1), // Dark background
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(height: 20),
          Container(
            width: 300, // Set your desired width
            height: 300, // Set your desired height
            child: FittedBox(
              fit: BoxFit.cover, // Use BoxFit.fill or other options if needed
              child: Image.asset("assets/images/image 1.png"),
            ),
          ),
          SizedBox(height: 0),
          Center(
            child: Text(
              'Please login to your',
              style: TextStyle(
                fontSize: 27,
                color: Colors.white, // Highlighted text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 50),
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
            child: Text(
              'Charge Hub account',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white, // Highlighted text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 50),
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
              event: _login,
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp(); // This navigates to the Sign-up page
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
                      text: ' Sign Up',
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

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return MapScreen(); // Navigates to the home page on successful login
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showSignUpPrompt();
      } else if (e.code == 'wrong-password') {
        _showErrorDialog('Incorrect password');
      } else {
        _showErrorDialog('Login failed. Please try again.');
      }
    } catch (e) {
      _showErrorDialog('An error occurred. Please try again.');
    }
  }

  void _showSignUpPrompt() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Account Found'),
          content: Text('No account found for this email. Would you like to sign up?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignUp(), // Navigate to Sign-up page
                  ),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
