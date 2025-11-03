//-----------Task1-----------
import 'dart:io';

main() {

  //User input
  print("Enter your Relationship state: ");
  String employee = stdin.readLineSync()!;

        //if the user entered "m" married
        if (employee == "m") {
          print("Enter number of your children: ");
          int m = int.parse(stdin.readLineSync()!);

          if (m >= 0 && m <= 3)
            print("your salary: 1200 + $m*150 = ${m * 150 + 1200}");
          else if (m >= 4 && m <= 6)
            print("your salary: 1800 + $m*250 = ${m * 250 + 1800}");
          else if (m >= 7)
            print("your salary: 2000 + $m*300 = ${m * 300 + 2000}");
          else
            ("Error! Enter a number please...");
        }

        //if user entered "s" single
        else if (employee == "s") {
          print("Enter your years at the company: ");
          int s = int.parse(stdin.readLineSync()!);

          if (s >= 0 && s <= 5)
            print("your salary: 1000 + $s*200 = ${s * 200 + 1000} ");
          else if (s >= 6 && s <= 10)
            print("your salary: 1500 + $s*400 = ${s * 400 + 1500}");
          else if (s >= 11)
            print("your salary: 2000 + $s*600 = ${s * 600 + 2000}");
          else
            ("Error! Enter a number please...");
        }

        //Error if user entered wrong input
         else
           print("Error! Please enter M for married or S for Single. ");
}