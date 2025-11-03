// import 'package:flutter/material.dart';
// import 'package:untitled/we%20flutter%20sessions/session11%20%20(19-8-2024)/task%2011.1/buttons.dart';
//
// class Prodapp extends StatelessWidget {
//   var tea = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Container(
//         width: double.infinity,
//         child: Column(
//           children: [
//             Text('Tea ,  price = 50 LE',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontFamily: 'font1',
//                   height: 4
//                 ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//             child: TextFormField(
//               keyboardType: TextInputType.number,
//               controller: tea,
//
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25)
//                 ),
//                 labelText: 'Count: ',
//                 hintText: 'Enter number of Tea...',
//
//               ),
//             ),
//             ),
//             btnCal(text: 'Cal', event: (){
//               print(int.parse(tea.text)*50);
//             }
//             )
//           ],
//         ),
//       ),
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:untitled/we_flutter_sessions/session11%20%20(19-8-2024)/task%2011.1/buttons.dart';

class Prodapp extends StatefulWidget {
  @override
  _ProductappState createState() => _ProductappState();
}

class _ProductappState extends State<Prodapp> {
  var tea = TextEditingController();
  var coffee = TextEditingController();
  var water = TextEditingController();
  String total = "0";

  void calculateTotal() {
    int teaTotal = int.parse(tea.text.isEmpty ? '0' : tea.text) * 50;
    int coffeeTotal = int.parse(coffee.text.isEmpty ? '0' : coffee.text) * 40;
    int waterTotal = int.parse(water.text.isEmpty ? '0' : water.text) * 10;
    int grandTotal = teaTotal + coffeeTotal + waterTotal;
    setState(() {
      total = grandTotal.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coffee Shop',
          style: TextStyle(color: Colors.white, fontFamily: 'font1'),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  'Tea:  50 LE',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'font1',
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: tea,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: 'Count:',
                  hintText: 'Enter number of Tea...',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  'Coffee:  40 LE',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'font1',
                    height: 2,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: coffee,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: 'Count:',
                  hintText: 'Enter number of Coffee...',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  'Water:  10 LE',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'font1',
                    height: 2,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: water,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: 'Count:',
                  hintText: 'Enter number of Water...',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: btnCal(
                  text: 'Calculate',
                  event: calculateTotal, // Call the calculation function
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Total: $total LE",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
