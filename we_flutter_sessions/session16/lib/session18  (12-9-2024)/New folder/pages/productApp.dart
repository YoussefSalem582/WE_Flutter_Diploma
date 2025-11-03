import 'package:flutter/material.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/component/buttons.dart';


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
