import 'package:flutter/material.dart';

class Massenger extends StatelessWidget {

  List<Map> story =
  [
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

  List<Map> chats =
  [
    {
      "name": "Joe Salem",
      "url": "assets/images/joe1.jpg",
      "massege": "How are you ??",
      "time": "8:25 pm"
    },
    {
      "name": "YoYo",
      "url": "assets/images/joe2.jpg",
      "massege": "come to alex tomorrow",
      "time": "2:15 am"
    },
    {
      "name": "YoSef",
      "url": "assets/images/joe3.jpg",
      "massege": "Fenak y3m !!",
      "time": "10:25 pm"
    },
    {
      "name": "يوسف حسن",
      "url": "assets/images/joe4.jpg",
      "massege": "هاتيجي ولا هتفكس ؟َ",
      "time": "11:25 pm"
    },
    {
      "name": "Youssef Salem",
      "url": "assets/images/joe5.jpg",
      "massege": "is there available internship ?",
      "time": "1:25 pm"
    },
    {
      "name": "Youssef FBI",
      "url": "assets/images/joe6.jpg",
      "massege": "I'm watching you !",
      "time": "10:25 am"
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Massenger',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for(int i=0;i<story.length;i++)

                ListTile(
                onTap: (){

                },
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(story[i]['url']),
                ),

              )
            ],
          ),
        )
    );
  }
}
