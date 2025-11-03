import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorDetails extends StatelessWidget {
  late Color c;
  late String text;
  ColorDetails(this.c, this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.c,
      body: Center(child: Text(this.text)),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class ColorDetails extends StatelessWidget {
//   final Color c;
//   final String text;ColorDetails(this.c, this.text);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(text), // Set the title to the color name
//         backgroundColor: c, // Set app bar colorto match
//       ),
//       backgroundColor: c, // Set background color to match
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context); // Go back to the previous page
//           },
//           child: Text(
//             "Go Back",
//             style: TextStyle(color: Colors.white), // White text for contrast
//           ),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.black, // Black button for contrast
//           ),
//         ),
//       ),
//     );
//   }
// }
