import'package:flutter/material.dart';
import'package:sqflite/sqflite.dart';
class UserDatabase{
  late Database db;

  createDatabaseAndTable()async{
    db=await openDatabase(
        "u.db",
        version: 1,
        onCreate: (Database d, int i)async{
          await d.execute('create table user (id integer primary key,'
              'name text, email text, password text');
          print("User Created !");
        }
    );
  }
}