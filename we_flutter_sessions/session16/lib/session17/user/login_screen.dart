// import 'package:flutter/material.dart';
// import '../admin/admin_dashboard.dart';
// import 'user_dashboard.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   String _userType = 'user'; // Default role
//
//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       if (_userType == 'admin') {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => AdminDashboardScreen()),
//         );
//       } else {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => UserDashboardScreen()),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) =>
//                 value!.isEmpty ? 'Enter your name' : null,
//               ),
//               SizedBox(height: 20),
//               DropdownButtonFormField<String>(
//                 value: _userType,
//                 items: [
//                   DropdownMenuItem(value: 'user', child: Text('User')),
//                   DropdownMenuItem(value: 'admin', child: Text('Admin')),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _userType = value!;
//                   });
//                 },
//                 decoration: InputDecoration(labelText: 'Select Role'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../admin/admin_dashboard.dart';
import '../db_helper.dart';
import '../registration_screen.dart';
import 'user_dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final db = await DBHelper().database;
    final result = await db.query(
      'users',
      where: 'fullname = ? AND password = ?',
      whereArgs: [_nameController.text, _passwordController.text],
    );

    if (result.isNotEmpty) {
      final user = result.first;
      if (user['type'] == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminDashboardScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserDashboardScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) =>
                value!.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                value!.isEmpty ? 'Enter your password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()),
                  );
                },
                child: Text('No account? Create one'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
