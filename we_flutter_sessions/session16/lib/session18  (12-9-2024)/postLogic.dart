import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'postState.dart';
import 'package:http/http.dart' as http;

class PostLogic extends Cubit<PostState> {
  List posts = [];

  PostLogic() : super(initState());

  void getPost() async {
    http.Response result = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    posts = jsonDecode(result.body);
    emit(getUser());
  }
}
