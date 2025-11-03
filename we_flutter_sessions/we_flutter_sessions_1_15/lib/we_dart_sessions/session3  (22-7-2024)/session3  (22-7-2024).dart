import 'dart:io';


//-----------Task 1
//main(){
//  print('Welcome Dart');
//}


//-----------Task 2
// main(){
//
//   print('Enter your numbers: ');
//
//   int x1 = int.parse(stdin.readLineSync()!);
//   int x2 = int.parse(stdin.readLineSync()!);
//   int x3 = int.parse(stdin.readLineSync()!);
//   int x4 = int.parse(stdin.readLineSync()!);
//
//   print('Result of x1+X2 = ${x1+x2}');
//   print('Result of x2-x3 = ${x2-x3}');
//   print('Result of x3/x4 = ${x3/x4}');
//   print('Result of x4*x4 = ${x4*x4}');
// }


//------------Task3
// main(){
//
//   String s = "java dart c++ flutter";
//
//   print(s.replaceAll(" ", "\n"));
// }


//--------------Task4
// main(){
//
//   //variables
//   double sum;
//
//   double apple = 25.50;
//   double banana = 30.25;
//   double watermelon = 90.00;
//   double orange = 45.75;
//
//   //Input numbers from user for each product
//   print("Enter number of apples: ");
//   int a = int.parse(stdin.readLineSync()!);
//
//   print("Enter number of bananas: ");
//   int b = int.parse(stdin.readLineSync()!);
//
//   print("Enter number of watermelons: ");
//   int w = int.parse(stdin.readLineSync()!);
//
//   print("Enter number of oranges: ");
//   int o = int.parse(stdin.readLineSync()!);
//
//   //Total price of each product
//   print("Total price of apples = ${a*apple}");
//   print("Total price of Bananas = ${b*banana}");
//   print("Total price of watermelons = ${w*watermelon}");
//   print("Total price of Oranges = ${o*orange}\n");
//
//   //Total price
//   print("Total price without discount = ${sum = (a*apple+b*banana+w*watermelon+o*orange)}" );
//   print("Total price with discount = ${sum -(((a*apple/100)*15)+((b*banana/100)*7.5)+((w*watermelon/100)*10)+((o*orange/100)*15))}" );
// }


//-------------Task5
// main(){
//
//   print("Enter your numbers: ");
//   int x = int.parse(stdin.readLineSync()!);
//   int y = int.parse(stdin.readLineSync()!);
//   print("Enter your oberator: ");
//   String op = stdin.readLineSync()!;
//   switch(op){
//     case '+':
//       print("Result of $x+$y = ${x+y}");
//     case '-':
//       print("Result of $x-$y = ${x-y}");
//     case '*':
//       print("Result of $x*$y = ${x*y}");
//     case '/':
//       print("Result of $x/$y = ${x/y}");
//
//   }
// }


//------------Task6
main(){
  print("Please enter your name: ");
  String name = stdin.readLineSync()!;

  print("Enter your Age: ");
  int age = int.parse(stdin.readLineSync()!);

  print("Enter your Grades: ");
  int g1 = int.parse(stdin.readLineSync()!);
  int g2 = int.parse(stdin.readLineSync()!);
  int g3 = int.parse(stdin.readLineSync()!);
  if(g1>50 && g2>50 && g3>50)
    print("Enter your Grades again! ");

  double sum;
  sum = ((g1+g2+g3)/150)*100;

  print("Your name is $name and Age is $age");
  print("Your Total grades of 150 is  ${g1+g2+g3} ");
  print("Your grade out of 100% is  $sum");

  if(sum<0 && sum>49)
  print("Fail");
  else if(sum<50 && sum<65)
    print("your grade is pass");
  else if(sum<66 && sum>75)
    print("your grade is good");
  else if(sum<76 && sum>85)
    print("Your grade is very good");
  else if(sum<86 && sum==100)
    print("Your grade is  Excellent");

}