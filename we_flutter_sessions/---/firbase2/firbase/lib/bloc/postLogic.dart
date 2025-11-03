import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firbase/models/post.dart';

import 'postState.dart';
import 'package:http/http.dart' as http;
class postLogic extends Cubit<postState>{
  List posts=[];
  postLogic():super(initState());
  void getpost()async{
    http.Response result=
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    List data=jsonDecode(result.body);
    data.forEach((v){
      posts.add(post(
          name: v["name"],
          email: v["email"],
          id: v["id"],
          postId: v["postId"],
        body: v["body"]
      ));
    });
    emit(getUser());
  }

}