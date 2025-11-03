

import 'package:flutter/material.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/pages/colorDetails.dart';
import '../component/texts.dart';



class ColorApp extends StatelessWidget {
  List<Map> colors=[
    {
      "text":"Yellow",
      "color":Colors.yellow
    },
    {
      "text":"Green",
      "color":Colors.green
    },
    {
      "text":"Red",
      "color":Colors.red
    },
    {
      "text":"Blue",
      "color":Colors.blue
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

             for(int i=0;i<colors.length;i++)
              textColor(
                  t:colors[i]['text'],
                  c: colors[i]['color'],
                  event: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c){
                          return ColorDetails(colors[i]['text'],colors[i]['color']);
                        })
                    );
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }
}
