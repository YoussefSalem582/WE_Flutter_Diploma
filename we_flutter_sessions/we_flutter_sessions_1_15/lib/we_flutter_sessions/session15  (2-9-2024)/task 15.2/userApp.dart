
import 'package:flutter/material.dart';
import 'userDatabase.dart';

class UserApp extends StatefulWidget {
  @override
  State<UserApp> createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  UserDatabase userobject = UserDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userobject.createDatabaseAndTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Database',
                style: TextStyle(fontSize: 50, color: Colors.blue),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () {
                userobject.insertData(
                    name: "nada", email: "nada@gamil.com", password: "987");
              },
              color: Colors.green,
              child: Text("Insert USER", style: TextStyle(fontSize: 40)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () async {
                print(await userobject.showUser());
              },
              color: Colors.grey,
              child: Text("Show USER", style: TextStyle(fontSize: 40)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () async {
                userobject.updateUser(
                    id: 1,
                    name: "ahmed",
                    email: "ahmed@gamil.com",
                    password: "654");
              },
              color: Colors.grey,
              child: Text(
                "update USER",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () async {
                userobject.deleteUser(
                  id: 1,
                );
              },
              color: Colors.red,
              child: Text(
                "Delete USER",
                style: TextStyle(fontSize: 40),
              ),
            ),
          )
        ],
      ),
    );
  }
}
