

import 'package:flutter/material.dart';


class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.grey,
      ),
      body:Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 50),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:AssetImage("assets/images/c2.jpeg")
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:AssetImage("assets/images/c2.jpeg")
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 50),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:AssetImage("assets/images/c2.jpeg")
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:AssetImage("assets/images/c2.jpeg")
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 50),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:AssetImage("assets/images/c2.jpeg")
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:AssetImage("assets/images/c2.jpeg")
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 50),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:AssetImage("assets/images/c2.jpeg")
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:AssetImage("assets/images/c2.jpeg")
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 50),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:AssetImage("assets/images/c2.jpeg")
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:AssetImage("assets/images/c2.jpeg")
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 50),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage:AssetImage("assets/images/c2.jpeg")
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:AssetImage("assets/images/c2.jpeg")
                  )
                ],
              )


            ],
          ),
        ),
      )
    );
  }
}

