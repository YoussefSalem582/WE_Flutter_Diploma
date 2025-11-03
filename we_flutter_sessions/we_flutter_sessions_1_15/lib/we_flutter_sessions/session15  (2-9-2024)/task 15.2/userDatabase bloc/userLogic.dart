import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/we_flutter_sessions/session15%20%20(2-9-2024)/task%2015.2/userDatabase%20bloc/userState.dart';

class UserLogic extends Cubit<Userstate> {
  List<Map> users = [];
  late Database db;

  UserLogic() : super(InitUser());

  // createDatabaseAndTable() async {
  //   db = await openDatabase(
  //       "u.db",
  //       version: 1,
  //       onCreate: (Database d, int i) async {
  //         await d.execute('create table user (id integer primary key,'
  //             'name text,email text,password text)');
  //         print("User Created !");
  //       }, onOpen: (Database d) {
  //     print("Database Open");
  //   }).then((v){
  //     db = v;
  //     emit(CreateUser());
  //   });
  //
  //   showUser().then((value) {
  //     users = value;
  //     emit(GetUser());
  //   });
  // }
  Future<void> createDatabaseAndTable() async {
    db = await openDatabase(
      "u.db",
      version: 1,
      onCreate: (Database d, int i) async {
        await d.execute('create table user (id integer primary key,'
            'name text,email text,password text)');
        print("User Created !");
      },
      onOpen: (Database d) {
        print("Database Open");
      },
    );

    // No need for .then() here, as await already handles the result
    emit(CreateUser());

    // Fetch users after database is created
    final fetchedUsers = await showUser();
    users = fetchedUsers;
    emit(GetUser());
  }

  insertData(
      {required String name,
      required String email,
      required String password}) async {
    await db.transaction((txn) async {
      txn
          .rawInsert("insert into user (name,email,password)"
              " values ('$name','$email','$password') ")
          .then((value) {
        print(" user Inserted Number  $value");
        emit(InsertUser());
        showUser().then((value) {
          users = value;
          emit(GetUser());
        });
      });
    });
  }

  Future<List<Map>> showUser() async {
    return await db.rawQuery("select * from user");
  }

  updateUser(
      {required int id,
      required String name,
      required String email,
      required String password}) async {
    await db
        .rawUpdate(
      'UPDATE user SET name = "$name",'
      ' email = "$email" ,password = "$password"'
      ' WHERE id = $id ',
    )
        .then((value) {
      print("update User $value");
      emit(UpdateUser());
      showUser().then((value) {
        users = value;
        emit(GetUser());
      });
    });

    deleteUser({required int id}) async {
      await db.rawDelete("delete from user where id = $id").then((value) {
        print("User Deleted $value");
        emit(DeleteUser());
        showUser().then((value) {
          users = value;
          emit(GetUser());
        });
      });
    }
  }
}
