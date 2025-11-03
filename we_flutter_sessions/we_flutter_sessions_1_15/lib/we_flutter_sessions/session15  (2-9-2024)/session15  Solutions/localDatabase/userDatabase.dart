

import 'package:sqflite/sqflite.dart';

class UserDatabase
{
  List<Map> users=[];
  late Database db;
  createDatabaseAndTable()async{
    db=await openDatabase(
      "u.db",
      version: 1,
      onCreate: (Database d, int i)async{
       await d.execute('create table user (id integer primary key,'
           'name text,email text,password text)');
       print("User Created !");
      },
      onOpen: (Database d){
        print("Database Open");
      }
    );
    showUser().then((value) {
      users =value;
      print(users);
    });
  }
  insertData({
  required String name,
 required String email,
 required String password
  })async {
   await db.transaction((txn)async{
    txn.rawInsert(
          "insert into user (name,email,password)"
          " values ('$name','$email','$password') "
      ).then((value) {
        print(" user Inserted Number  $value");
    });
   });
  }

 Future<List<Map>> showUser() async{
    return await db.rawQuery("select * from user");
 }

 updateUser({
   required int id,
   required String name,
   required String email,
   required String password
 })async{

  await db.rawUpdate(
       'UPDATE user SET name = "$name",'
           ' email = "$email" ,password = "$password"'
           ' WHERE id = $id ',
      );
  print("update User");
 }
deleteUser({required int id})async
{
  await db.rawDelete("delete from user where id = $id");
  print("User Deleted ");
}

}