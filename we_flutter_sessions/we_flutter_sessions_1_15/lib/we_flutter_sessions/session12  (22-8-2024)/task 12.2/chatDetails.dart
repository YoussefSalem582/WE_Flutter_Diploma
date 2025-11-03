import 'package:flutter/material.dart';

class Chatdetails extends StatelessWidget {
  late Map data;

  Chatdetails(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(data['name']),
        leading: CircleAvatar(
          backgroundImage: AssetImage(data['url']),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

      ),
    );
  }
}
