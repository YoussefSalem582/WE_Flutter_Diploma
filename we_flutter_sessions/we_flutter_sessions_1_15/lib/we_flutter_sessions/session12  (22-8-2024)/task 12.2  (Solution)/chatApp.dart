// import 'package:flutter/material.dart';
// import 'chat.dart';
// import 'chatDetails.dart';
//
// class ChatApp extends StatelessWidget {
//   List<Chat> chats = [
//     Chat(
//         name: "Joe Salem",
//         url: "assets/images/joe1.jpg",
//         message: "How are you ??",
//         time: "8:25 pm"),
//     Chat(
//         name: "YoYo",
//         url: "assets/images/joe2.jpg",
//         message: "come to alex tomorrow",
//         time: "2:15 am"),
//     Chat(
//         name: "YoSef",
//         url: "assets/images/joe3.jpg",
//         message: "Fenak y3m !!",
//         time: "10:25 pm"),
//     Chat(
//         name: "يوسف حسن",
//         url: "assets/images/joe4.jpg",
//         message: "هاتيجي ولا هتفكس ؟َ",
//         time: "11:25 pm"),
//     Chat(
//         name: "Youssef Salem",
//         url: "assets/images/joe5.jpg",
//         message: "is there available internship ?",
//         time: "1:25 pm"),
//     Chat(
//         name: "Youssef FBI",
//         url: "assets/images/joe6.jpg",
//         message: "I'm watching you !",
//         time: "10:25 am"),
//     Chat(
//         name: "Joe Salem",
//         url: "assets/images/joe1.jpg",
//         message: "How are you ??",
//         time: "8:25 pm"),
//     Chat(
//         name: "YoYo",
//         url: "assets/images/joe2.jpg",
//         message: "come to alex tomorrow",
//         time: "2:15 am"),
//     Chat(
//         name: "YoSef",
//         url: "assets/images/joe3.jpg",
//         message: "Fenak y3m !!",
//         time: "10:25 pm"),
//     Chat(
//         name: "يوسف حسن",
//         url: "assets/images/joe4.jpg",
//         message: "هاتيجي ولا هتفكس ؟َ",
//         time: "11:25 pm"),
//     Chat(
//         name: "Youssef Salem",
//         url: "assets/images/joe5.jpg",
//         message: "is there available internship ?",
//         time: "1:25 pm"),
//     Chat(
//         name: "Youssef FBI",
//         url: "assets/images/joe6.jpg",
//         message: "I'm watching you !",
//         time: "10:25 am"),
//   ];
//
//   List<Map> story = [
//     {
//       "name": "Joe Salem",
//       "url": "assets/images/joe1.jpg",
//     },
//     {
//       "name": "YoYo",
//       "url": "assets/images/joe2.jpg",
//     },
//     {
//       "name": "YoSef",
//       "url": "assets/images/joe3.jpg",
//     },
//     {
//       "name": "يوسف حسن",
//       "url": "assets/images/joe4.jpg",
//     },
//     {
//       "name": "Youssef Salem",
//       "url": "assets/images/joe5.jpg",
//     },
//     {
//       "name": "Youssef FBI",
//       "url": "assets/images/joe6.jpg",
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           'Massenger',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   for (int i = 0; i < story.length; i++)
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, top: 15),
//                       child: Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 50,
//                             backgroundImage: AssetImage(story[i]['url']),
//                           ),
//                           Text(
//                             story[i]['name'],
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           )
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 40,),
//             Column(
//               children: [
//                 for (int i = 0; i < chats.length; i++)
//                   ListTile(
//                     onTap: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (c) {
//                         return ChatDetails(chats[i]);
//                       }));
//                     },
//                     leading: CircleAvatar(
//                       radius: 35,
//                       backgroundImage: AssetImage(chats[i].url),
//                     ),
//                     title: Text(
//                       chats[i].name,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     subtitle: Text(
//                       chats[i].message,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     trailing: Text(
//                       chats[i].time,
//                       textAlign: TextAlign.end,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.brown),
//                     ),
//                   ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'chat.dart';
import 'chatDetails.dart';

class ChatApp extends StatelessWidget {
  List<Chat> chats = [
    Chat(
        name: "Joe Salem",
        url: "assets/images/joe1.jpg",
        message: "How are you ??",
        time: "8:25 pm"),
    Chat(
        name: "YoYo",
        url: "assets/images/joe2.jpg",
        message: "come to alex tomorrow",
        time: "2:15 am"),
    Chat(
        name: "YoSef",
        url: "assets/images/joe3.jpg",
        message: "Fenak y3m !!",
        time: "10:25 pm"),
    Chat(
        name: "يوسف حسن",
        url: "assets/images/joe4.jpg",
        message: "هاتيجي ولا هتفكس ؟َ",
        time: "11:25 pm"),
    Chat(
        name: "Youssef Salem",
        url: "assets/images/joe5.jpg",
        message: "is there available internship ?",
        time: "1:25 pm"),
    Chat(
        name: "Youssef FBI",
        url: "assets/images/joe6.jpg",
        message: "I'm watching you !",
        time: "10:25 am"),
    Chat(
        name: "Joe Salem",
        url: "assets/images/joe1.jpg",
        message: "How are you ??",
        time: "8:25 pm"),
    Chat(
        name: "YoYo",
        url: "assets/images/joe2.jpg",
        message: "come to alex tomorrow",
        time: "2:15 am"),
    Chat(
        name: "YoSef",
        url: "assets/images/joe3.jpg",
        message: "Fenak y3m !!",
        time: "10:25 pm"),
    Chat(
        name: "يوسف حسن",
        url: "assets/images/joe4.jpg",
        message: "هاتيجي ولا هتفكس ؟َ",
        time: "11:25 pm"),
    Chat(
        name: "Youssef Salem",
        url: "assets/images/joe5.jpg",
        message: "is there available internship ?",
        time: "1:25 pm"),
    Chat(
        name: "Youssef FBI",
        url: "assets/images/joe6.jpg",
        message: "I'm watching you !",
        time: "10:25 am"),
  ];

  List<Map> story = [
    {
      "name": "Joe Salem",
      "url": "assets/images/joe1.jpg",
    },
    {
      "name": "YoYo",
      "url": "assets/images/joe2.jpg",
    },
    {
      "name": "YoSef",
      "url": "assets/images/joe3.jpg",
    },
    {
      "name": "يوسف حسن",
      "url": "assets/images/joe4.jpg",
    },
    {
      "name": "Youssef Salem",
      "url": "assets/images/joe5.jpg",
    },
    {
      "name": "Youssef FBI",
      "url": "assets/images/joe6.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Massenger',
          style: TextStyle(color: Colors.white,fontFamily: 'font1'),
        ),
      ),
      body: Column(
        children: [
          // Story Section
          Container(
            height: 180, // Fixed height for the story section
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < story.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(story[i]['url']),
                          ),
                          Text(
                            story[i]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Chat List Section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < chats.length; i++)
                    Column(
                      children: [
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            chats[i].message,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          trailing: Text(
                            chats[i].time,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ),
                        Divider(thickness: 1.5),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
