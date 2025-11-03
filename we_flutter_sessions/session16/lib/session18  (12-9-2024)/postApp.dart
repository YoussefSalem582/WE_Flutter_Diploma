//-------------------------   API  ----------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session16/session18%20%20(12-9-2024)/postLogic.dart';
import 'package:session16/session18%20%20(12-9-2024)/postState.dart';

class PostApp extends StatefulWidget {
  const PostApp({super.key});

  @override
  State<PostApp> createState() => _PostappState();
}

class _PostappState extends State<PostApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostLogic()..getPost(),
      child: BlocConsumer<PostLogic, PostState>(
        listener: (context, state) {},
        builder: (context, state) {
          PostLogic obj = BlocProvider.of(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.amberAccent,
                title: const Text('Post App'),
              ),
              body: (obj.posts.isNotEmpty)
                  ? ListView(
                      children: [
                        for (int i = 0; i < obj.posts.length; i++)
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(obj.posts[i]['id'].toString()),
                            ),
                            title: Text(obj.posts[i]['email'],
                          )
                          ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    )));
        },
      ),
    );
  }
}
