import 'package:flutter/material.dart';
import 'package:untitled/we_flutter_sessions/session12%20%20(22-8-2024)/task%2012.2%20%20(Solution)/chat.dart';
import 'package:untitled/we_flutter_sessions/session12%20%20(22-8-2024)/task%2012.2%20%20(Solution)/chatDetails.dart';

class ChatApp extends StatelessWidget {
  List<Chat> chats = [
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
    Chat(
        name: "Ali Ahmed",
        url: "assets/images/c2.jpeg",
        message: "Fine !",
        time: "22:30"),
  ];

  List<Map> story = [
    {
      "name": "Ali Ahmed",
      "url": "assets/images/c2.jpeg",
    },
    {
      "name": "Ali Ahmed",
      "url": "assets/images/c2.jpeg",
    },
    {
      "name": "Ali Ahmed",
      "url": "assets/images/c2.jpeg",
    },
    {
      "name": "Ali Ahmed",
      "url": "assets/images/c2.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < story.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(story[i]['url']),
                          ),
                          Text(
                            story[i]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < chats.length; i++)
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (c) {
                        return ChatDetails(chats[i]);
                      }));
                    },
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(chats[i].url),
                    ),
                    title: Text(
                      chats[i].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    subtitle: Text(
                      chats[i].message,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    trailing: Text(
                      chats[i].time,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
