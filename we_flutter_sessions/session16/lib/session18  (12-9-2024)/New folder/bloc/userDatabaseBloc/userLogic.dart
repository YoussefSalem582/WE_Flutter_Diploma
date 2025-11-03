
import 'package:bloc/bloc.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/bloc/userDatabaseBloc/userState.dart';
import 'package:sqflite/sqflite.dart';

class UserLogic extends Cubit<UserState>
{
  List<Map> users=[];
  List<Map> departments=[];
  List<Map> employees=[];
  List<Map> deEM=[];
  late Database db;
  UserLogic():super(InitUser());

  createDatabaseAndTable()async{
    await openDatabase(
        "u.db",
        version: 3,
        onCreate: (Database d, int i)async{
          await d.execute('create table user (id integer primary key,'
              'name text,email text,password text)');
          print("User Created !");
        },
        onUpgrade: (Database d,int i,int m)async{
          /*
          await d.execute('create table department (id integer primary key,'
              'de_name text,manager_id integer)');
          print("department Created !");

           */
          await d.execute('create table employee (id integer primary key,'
              'name text,salary integer,de_id integer,FOREIGN KEY(de_id) REFERENCES department(id))');
          print("employee Created !");
        },
        onOpen: (Database d){
          print("Database Open");
        }
    ).then((v){
      db=v;
      emit(CreateUser());
    });

    showUser().then((value) {
      users =value;
     emit(GetUser());
    });
    showDepartment().then((value) {
      departments=value;
      print("List of Departments is $departments");
      emit(GetDepartment());
    });
    showEmployee().then((value) {
      employees=value;
      print("List of Employees is $employees");
      emit(GetEmployee());
    });

    showDepartmentAndEmployee().then((value) {
      deEM=value;
      print("List of Employees And Department is $deEM");
      emit(GetEmployeeAndDepartment());
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
        emit(InsertUser());
        showUser().then((value){
          users=value;
          emit(GetUser());
        });


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
    ).then((value) {
      print("update User $value");
      emit(UpdateUser());
      showUser().then((value){
        users=value;
        emit(GetUser());
      });
    });

  }
  deleteUser({required int id})async
  {
   await db.rawDelete("delete from user where id = $id").then((value){
      print("User Deleted $value");
      emit(DeleteUser());
      showUser().then((value){
        users=value;
        emit(GetUser());
      });
    });

  }


  //     Department Table

  insertDepartment({
    required int id,
    required String name,
    required int manager_id
  })async {
    await db.transaction((txn)async{
      txn.rawInsert(
          "insert into department "
              " values ('$id','$name','$manager_id') "
      ).then((value) {
        print(" Department  $value");
        emit(InsertDepartment());
      });
    });
  }

  Future<List<Map>> showDepartment() async{
    return await db.rawQuery("select * from department");
  }

  //     Department Table

  insertEmployee({
    required int id,
    required String name,
    required int salary,
    required int de_id
  })async {
    await db.transaction((txn)async{
      txn.rawInsert(
          "insert into employee "
              " values ('$id','$name','$salary','$de_id') "
      ).then((value) {
        print(" Employee  $value");
        emit(InsertEmployee());
      });
    });
  }

  Future<List<Map>> showEmployee() async{
    return await db.rawQuery("select * from employee");
  }
//             Join   Department   and  Employee
  Future<List<Map>> showDepartmentAndEmployee() async{
    return await db.rawQuery("select * from department,employee"
        " where employee.de_id=department.id");
  }

}