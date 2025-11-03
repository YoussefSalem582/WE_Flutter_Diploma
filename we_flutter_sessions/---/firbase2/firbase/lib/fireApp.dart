import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireApp extends StatefulWidget {
  @override
  State<FireApp> createState() => _FireAppState();
}

class _FireAppState extends State<FireApp> {
  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();

  CollectionReference person = FirebaseFirestore.instance.collection('persons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Firebase"),
      ),
      body: Column(
        children: [
          Text(
            'Hello Firebase',
            style: TextStyle(fontSize: 30),
          ),
          Divider(
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          Center(
            child: Text(
              'Enter Your Info',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Divider(
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'password',
              ),
            ),
          ),
          MaterialButton(
            color: Colors.blueGrey,
            child: Text("Add Info"),
            onPressed: () {
              person.add({
                'email': email.text,
                'name': name.text,
                'password': password.text,
              }).then((value) => print("Info Added"))
                  .catchError((error) => print("Failed to add info: $error"));

              setState(() {
                email.clear();
                name.clear();
                password.clear();
              });
            },
          ),
          Divider(
            thickness: 3,
            indent: 20,
            endIndent: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: person.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  final data = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var userData = data[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(userData['name'] ?? 'No Name'),
                        subtitle: Text(userData['email'] ?? 'No Email'),
                      );
                    },
                  );
                }

                return Center(child: Text('No data found'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
