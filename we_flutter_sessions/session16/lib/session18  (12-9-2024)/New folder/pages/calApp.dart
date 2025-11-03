import 'package:flutter/material.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/pages/secondPage.dart';
import '../component/buttons.dart';


class CalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: [
            Text("0"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btnCal(
                    text: "1",
                    event:(){}
                ),
                btnCal(
                    text: "2",
                    event:  (){}
                ),
                btnCal(
                    text: "3",
                    event:(){}
                ),

              ],
            ),
            btnCal(text: "=",

                c: Colors.red
                , event: (){})
            ,btnCal(text: "Second Page", event: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (c){
                  return SecondPage();
                })
              );

            })

          ],
        ),

    );
  }
}
