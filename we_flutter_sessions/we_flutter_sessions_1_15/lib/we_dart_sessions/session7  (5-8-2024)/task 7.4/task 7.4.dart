//-------Task3----------

import 'dart:io';
import 'car 7.4.dart';

main() {
  List<Car> Cars = [];

  //user enter number of cars---1
  stdout.write("Enter number of cars: ");
  int numCars = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < numCars; i++) {
    Car c = Car();

    stdout.write("Enter car model: ");
    c.model = stdin.readLineSync()!;

    stdout.write("Enter car price: ");
    c.price = double.parse(stdin.readLineSync()!);

    stdout.write("Enter car color: ");
    c.color = stdin.readLineSync()!;

    stdout.write("Enter car code: ");
    c.code = int.parse(stdin.readLineSync()!);

    Cars.add(c);

    // Count each car
    print("Car ${i + 1} added.\n");
  }

  //print total price---2
  double totalPrice = 0;
  for (Car car in Cars) {
    totalPrice += car.price!;
  }
  print("\nTotal price of all cars: $totalPrice");

  //print each car alone---3
  print("\nCar Details:");
  for (Car car in Cars) {
    car.printEmployee();
  }

  //print max & min---4
  if (Cars.isNotEmpty) {
    double maxPrice = Cars[0].price!;
    double minPrice = Cars[0].price!;

    for (Car car in Cars) {
      if (car.price! > maxPrice) {
        maxPrice = car.price!;
      }
      if (car.price! < minPrice) {
        minPrice = car.price!;
      }
    }
    print("\nMax Price: $maxPrice, Min Price: $minPrice");
  } else {
    print("\nNo cars entered.");
  }
}