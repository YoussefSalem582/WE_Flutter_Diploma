import 'package:flutter/material.dart';
import 'showUserData.dart';
import 'userDatailsPage.dart';

class Databaseapp extends StatefulWidget {
@override
State<Databaseapp> createState() => _userDatabaseState();
}

class _userDatabaseState extends State<Databaseapp> {
  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();ShowUserData userobject = ShowUserData();

  @override
  void initState() {
    super.initState();
    userobject.createDatabaseAndTable();  //.then((_) => refreshUsers());
  }

  // void refreshUsers() async {
  //   userobject.users = await userobject.showUser();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Container(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Database',
                    style: TextStyle(fontSize: 40, fontFamily: 'font1'),
                  ),
                ),
              ),
              // Display list of users with edit and delete icons
              for (int i = 0; i < userobject.users.length; i++)
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) {
                              return userDetails(userobject.users[i]);
                            },
                          ));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: Text(userobject.users[i]['id'].toString()),
                          ),
                          title: Text(userobject.users[i]['name']),
                        ),
                      ),
                    ),
                    // Edit Icon
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) {
                            return userDetails(userobject.users[i]);
                          },));
                      },
                      icon: Icon(Icons.edit),
                      color: Colors.blue,
                    ),
                    // Delete Icon
                    IconButton(
                      onPressed: () async {
                        await userobject.delData(id: userobject.users[i]['id']);

                        userobject.users = await userobject.showUser();
                        setState(() {

                        });
                        // refreshUsers();
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ],
                ),
              Divider(
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 40, fontFamily: 'font1'),
                  ),
                ),
              ),

              Divider(
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
              // Input fields for adding new users
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              // Insert Button
              MaterialButton(
                onPressed: () async {
                  userobject.insertData(
                      name: name.text,
                      email: email.text,
                      password: password.text);
                  email.text = '';
                  name.text = '';
                  password.text = '';
                  userobject.users = await userobject.showUser();

                  setState(() {

                  });
                  // refreshUsers(); // Refresh the list after inserting
                },
                color: Colors.green,
                child: Text('Enter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}