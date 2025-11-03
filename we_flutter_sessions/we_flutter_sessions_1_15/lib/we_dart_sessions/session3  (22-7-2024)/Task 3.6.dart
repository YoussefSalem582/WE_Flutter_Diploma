// //------------Task6-----------------  " For Loop "
// import 'dart:io';
//
// main() {
//   print("Please enter your name: ");
//   String name = stdin.readLineSync()!;
//
//   print("Enter your Age: ");
//   int age = int.parse(stdin.readLineSync()!);
//
//   print("Enter your Grades: ");
//   int g1 = int.parse(stdin.readLineSync()!);
//   int g2 = int.parse(stdin.readLineSync()!);
//   int g3 = int.parse(stdin.readLineSync()!);
//
//   if(g1>50 && g2>50 && g3>50)
//     print("Enter your Grades again! ");
//
//   switch (g1) {
//     case > 50:
//       print("Error! Enter your grades again ");
//
//     case <=50:
//       double sum;
//       sum = ((g1 + g2 + g3) / 150) * 100;
//
//       print("Your name is $name and Age is $age");
//       print("Your Total grades of 150 is ($g1 +$g2+$g3 = ${g1 + g2 + g3}) ");
//       print("Your grade out of 100% is  $sum");
//
//       if (sum >= 0 && sum <= 49)
//         print("Fail");
//       else if (sum >= 50 && sum <= 65)
//         print("your grade is pass");
//       else if (sum >= 66 && sum <= 75)
//         print("your grade is good");
//       else if (sum >= 76 && sum <= 85)
//         print("Your grade is very good");
//       else if (sum >= 86 && sum == 100)
//         print("Your grade is  Excellent");
//       else
//         print("Errorrrrr");
//
//   // switch(sum){
//   //   case >= 0 && <= 49:
//   //     print("Fail");
//   //   case  >= 50 &&  <= 65:
//   //     print("your grade is pass");
//   //   case  >= 66 &&  <= 75:
//   //     print("your grade is good");
//   //   case  >= 76 &&  <= 85:
//   //     print("Your grade is very good");
//   //   case  >= 86 &&  == 100:
//   //     print("Your grade is  Excellent");
//
//   }
// }

import 'dart:io';

void main() {
  print("Please enter your name: ");
  String name = stdin.readLineSync()!;

  print("Enter your Age: ");
  int age = int.parse(stdin.readLineSync()!);

  List<int> grades = [];
  for (int i = 1; i <= 3; i++) {
    print("Enter grade $i: ");
    int grade = int.parse(stdin.readLineSync()!);
    while (grade < 0 || grade > 50) {
      print("Invalid grade. Grades should be between 0 and 50. Enter again: ");
      grade = int.parse(stdin.readLineSync()!);
    }
    grades.add(grade);
  }

  double sum = grades.reduce((a, b) => a + b) / 150 * 100;

  print("\nYour name is $name and Age is $age");
  print(
      "Your Total grades of 150 is (${grades.join(' + ')}) = ${grades.reduce((a, b) => a + b)}");
  print("Your grade out of 100% is  ${sum.toStringAsFixed(2)}");

  if (sum >= 0 && sum <= 49) {
    print("Fail");
  } else if (sum >= 50 && sum <= 65) {
    print("Your grade is pass");
  } else if (sum >= 66 && sum <= 75) {
    print("Your grade is good");
  } else if (sum >= 76 && sum <= 85) {
    print("Your grade is very good");
  } else if (sum >= 86 && sum <= 100) {
    print("Your grade is Excellent");
  } else {
    print("Error: Invalid grade calculation.");
  }
}
