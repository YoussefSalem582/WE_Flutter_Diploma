import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:firbase/postApp.dart';
import 'bloc/postLogic.dart';
import 'bloc/postState.dart';

class postApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => postLogic()..getpost(),
        child: BlocConsumer<postLogic,postState>(
          listener: (context, state) {},
          builder: (context, state) {
            postLogic obj = BlocProvider.of(context);
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blueGrey,
                  title: Text('Post App'),
                ),
                body: (obj.posts.length>0)
                    ?
                ListView(
                  children: [
                    for(int i=0;i<obj.posts.length;i++)
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(obj.posts[i].id.toString()),
                        ),
                        title: Text(obj.posts[i].name),
                      )
                  ],
                )
                    :
                Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.pink,
                ))
            );
          },
        ),
        );
    }
}
