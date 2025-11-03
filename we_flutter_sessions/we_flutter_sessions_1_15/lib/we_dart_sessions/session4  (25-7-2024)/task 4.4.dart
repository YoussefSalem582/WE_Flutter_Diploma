//---------Task4-----------  " Loop Factorial"
import 'dart:io';

main() {
  print("Enter yor number to be factorial: ");
  int num = int.parse(stdin.readLineSync()!);
  int sum=1;

  while(num>0){
    sum *=num;
    num--;
  }
  print("Your factorial number is $sum ");
}