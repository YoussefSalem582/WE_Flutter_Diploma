// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class FireApp extends StatelessWidget {
//   CollectionReference course = FirebaseFirestore.instance.collection('users');
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text("FireBase"),
//               centerTitle: true,
//               backgroundColor: Colors.orange,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Welcome FireBase',
//                     style: TextStyle(fontSize: 40),
//                   ),
//                   MaterialButton(
//                       color: Colors.red,
//                       child: Text('data'),
//                       onPressed: () {
//                         course
//                             .add({
//                               'full_name': "Joe salem", // John Doe
//                               'company': "NU", // Stokes and Sons
//                               'age': 21 // 42
//                             })
//                             .then((value) => print("User Added"))
//                             .catchError(
//                                 (error) => print("Failed to add user: $error"));
//                       })
//                 ],
//               ),
//             )));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireApp extends StatefulWidget {
  const FireApp({super.key});

@override
_FireAppState createState() => _FireAppState();
}

class _FireAppState extends State<FireApp> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final _formKey = GlobalKey<FormState>();
  final _fullNameController= TextEditingController();
  final _companyController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _companyController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _addUser() {
    if (_formKey.currentState!.validate()) {
      users
          .add({
        'full_name': _fullNameController.text,
        'company': _companyController.text,
        'age': int.parse(_ageController.text),
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      // Clear the form fields after adding the user
      _fullNameController.clear();
      _companyController.clear();
      _ageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("FireBase"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome FireBase',
                  style: TextStyle(fontSize: 40),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(labelText: 'Full Name'),
                    validator: (value) {if (value == null || value.isEmpty) {
                      return 'Please enter a full name';
                    }
                    return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _companyController,
                    decoration: InputDecoration(labelText: 'Company'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a company';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an age';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addUser,
                  child: Text('Add User'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}