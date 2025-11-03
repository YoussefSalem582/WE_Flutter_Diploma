//-------Task3----------

import 'dart:io';
import 'car 7.3.dart';

main(){

  //car 1
  Car c1 = Car(
      model: 'toyota',
      price: 200000,
      color: 'gray',
      code: 232344
  );
  c1.printEmployee();


  //car 2 empty
  Car c2 = Car();

  stdout.write("Enter car model: ");
  c2.model = stdin.readLineSync()!;

  stdout.write("Enter car price: ");
  c2.price = double.parse(stdin.readLineSync()!);

  stdout.write("Enter car color: ");
  c2.color = stdin.readLineSync()!;

  stdout.write("Enter car model: ");
  c2.code = int.parse(stdin.readLineSync()!);

  c2.printEmployee();

}