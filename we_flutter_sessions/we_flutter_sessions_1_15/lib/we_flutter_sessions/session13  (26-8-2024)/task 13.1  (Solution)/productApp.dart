import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../session11  (19-8-2024)/task 11.3  (solution)/buttons.dart';

class ProductApp extends StatelessWidget {

  TextEditingController tea=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text('Tea  50 LE '),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.number,

                controller:tea ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  labelText: 'Count',
                  hintText: 'enter number 1  to  10 ',
                  suffixIcon: Icon(Icons.account_circle_sharp)
                ),
              ),
            ),
            btnCal(text: "Cal", event: (){
              print(int.parse(tea.text)*50);
            })
          ],


        ),
      ),
    );
  }
}
