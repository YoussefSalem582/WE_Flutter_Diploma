import 'package:flutter/material.dart';
import 'chat.dart';


class ChatDetails extends StatelessWidget {
 late Chat data;

 ChatDetails(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(data.name),
        leading: CircleAvatar(
          backgroundImage: AssetImage(data.url),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
             Text(data.message,style:
               TextStyle(
                 fontSize: 35,
                 color: Colors.grey,
                 fontWeight: FontWeight.w300
               ),) ,
          Text(data.time,style:
          TextStyle(
              fontSize: 25,
              color: Colors.grey,
              fontWeight: FontWeight.w300
          ),)
        ],
      ),
    );
  }
}
