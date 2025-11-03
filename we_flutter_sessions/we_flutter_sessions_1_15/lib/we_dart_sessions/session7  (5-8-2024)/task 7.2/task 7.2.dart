//-------Task2----------

import 'dart:io';
import 'car 7.2.dart';

main(){
  Car c1 = Car();

  c1.model = 'Ford';
  c1.price = 200000;
  c1.color = 'Blue';
  c1.code = 2024228;

  print('car model: ' + c1.model +'\n'+
      'car price: ' + c1.price.toString() +'\n'+
      'car color: ' + c1.color +'\n'+
      'car code: ' + c1.code.toString()+'\n');

  Car c2 = Car();

  stdout.write("Enter car model: ");
  c2.model = stdin.readLineSync()!;
  stdout.write("Enter car price: ");
  c2.price = double.parse(stdin.readLineSync()!);
  stdout.write("Enter car color: ");
  c2.color = stdin.readLineSync()!;
  stdout.write("Enter car model: ");
  c2.code = int.parse(stdin.readLineSync()!);

  print('\n'+'car model: ' + c2.model +'\n'+
      'car price: ' + c2.price.toString() +'\n'+
      'car color: ' + c2.color +'\n'+
      'car code: ' + c1.code.toString());

}