//-------------Task5---------------  " Switch "
import 'dart:io';

main(){

  print("Enter your numbers: ");
  int x = int.parse(stdin.readLineSync()!);
  int y = int.parse(stdin.readLineSync()!);
  print("Enter your oberator: ");
  String op = stdin.readLineSync()!;
  switch(op){
    case '+':
      print("Result of $x+$y = ${x+y}");
    case '-':
      print("Result of $x-$y = ${x-y}");
    case '*':
      print("Result of $x*$y = ${x*y}");
    case '/':
      print("Result of $x/$y = ${x/y}");

  }
}