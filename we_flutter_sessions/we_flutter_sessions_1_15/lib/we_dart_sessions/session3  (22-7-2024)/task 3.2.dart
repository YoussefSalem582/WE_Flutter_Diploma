//-----------Task 2----------   " User input "
import 'dart:io';

main(){

  print('Enter your numbers: ');

  int x1 = int.parse(stdin.readLineSync()!);
  int x2 = int.parse(stdin.readLineSync()!);
  int x3 = int.parse(stdin.readLineSync()!);
  int x4 = int.parse(stdin.readLineSync()!);

  print('Result of x1+X2 = ${x1+x2}');
  print('Result of x2-x3 = ${x2-x3}');
  print('Result of x3/x4 = ${x3/x4}');
  print('Result of x4*x4 = ${x4*x4}');
}