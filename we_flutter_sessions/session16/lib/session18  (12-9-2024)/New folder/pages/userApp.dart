
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/bloc/userDatabaseBloc/userLogic.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/bloc/userDatabaseBloc/userState.dart';



class UserApp extends StatelessWidget {
  const UserApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>UserLogic()..createDatabaseAndTable(),
      child: BlocConsumer<UserLogic,UserState>(
        listener:(context,state){
          if(state is InsertUser)
            print("State Insert ");
          if(state is CreateUser)
            print("State Create ");
          if(state is GetUser)
            print("State Get ");


        } ,
        builder:(context,state){
          TextEditingController email=TextEditingController();
          TextEditingController name=TextEditingController();
          TextEditingController password=TextEditingController();

          UserLogic userObject=BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
            ),
            body: ListView(
              children: [
                const Center(
                  child: Text('Database',style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue
                  ),),
                ),
                MaterialButton(
                  onPressed: ()async{
                    userObject.insertDepartment(
                        id: 101,
                        name: "CS",
                        manager_id: 1001
                    );
                    userObject.insertDepartment(
                        id: 102,
                        name: "IS",
                        manager_id: 1002
                    );
                    userObject.insertDepartment(
                        id: 103,
                        name: "IT",
                        manager_id: 2001
                    );


                  },
                  color: Colors.red,
                  child: Text("Insert Departments"),

                ),
                MaterialButton(
                  onPressed: ()async{
                    userObject.insertEmployee(
                        id: 1,
                        name: "ali",
                        salary: 2000,
                        de_id: 102
                    );
                    userObject.insertEmployee(
                        id: 2,
                        name: "ahmed",
                        salary: 1500,
                        de_id: 103
                    );
                    userObject.insertEmployee(
                        id: 3,
                        name: "nada",
                        salary: 1900,
                        de_id: 102
                    );
                    userObject.insertEmployee(
                        id: 4,
                        name: "sara",
                        salary: 3000,
                        de_id: 103
                    );


                  },
                  color: Colors.red,
                  child: const Text("Insert Employee"),

                ),

                /*
                for(int i=0;i<userObject.users.length;i++)
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child:Text(userObject.users[i]['id'].toString()) ,
                    ),
                    title: Text(userObject.users[i]['email']),
                  ),
                */
                const Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                const Center(
                  child: Text("User Insertation",
                    style: TextStyle(
                        fontSize: 33,
                        color: Colors.blue,
                        fontFamily: 'font1'
                    ),
                  ),
                ),
                const Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50,
                      left: 8,
                      right: 8,
                      bottom: 8
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        )
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: ()async{
                    userObject.insertData(
                        name: name.text,
                        email: email.text,
                        password: password.text
                    );
                    name.text='';
                    password.text='';
                    email.text='';
                  },
                  color: Colors.red,
                  child: const Text("Insert USER"),

                ),
              ],
            ),
          );

        } ,
      ),
    );
  }
}
