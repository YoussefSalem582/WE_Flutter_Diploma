// //--------Task1---------   " List < Map > "
//
// // main(){
// //   List<Map> products =[
// //     {
// //       "name":"T",
// //       "price":450,
// //       "color":["red","blue"]
// //     },
// //     {
// //       "name":"M",
// //       "price":300,
// //       "color":["yellow","blue","brown"]
// //     },
// //   ];
// //   for(int i=0; i<products.length; i++)
// //     {
// //       print("products name is ${products[i]['name']} and price is ${products[i]['price']}");
// //     }
// // }
//
// // import 'dart:io';
// //
// // main() {
// //   List students = [];
// //   stdout.write("Enter the number of students: ");
// //   int numStudents = int.parse(stdin.readLineSync()!);
// //   int sum = 0;
// //   int degree =0;
// //
// //   for (int i = 0; i < size; i++) {
// //   for (int i = 0; i < size; i++) {
// //     stdout.write("Enter ID ${i + 1}: ");
// //     int studentID = int.parse(stdin.readLineSync()!);
// //     students.add(studentID);
// // }
// //   for (int j = 0; j < size; j++) {
// //     stdout.write("Enter student name ${j + 1}: ");
// //     String studentName = stdin.readLineSync()!;
// //     students.add(studentName);
// //   }
// //   int degree = int.parse(stdin.readLineSync()!);
// //   while (degree >=3) {
// //     if (degree >= 50) {
// //       print("Enter your degrees: ");
// //       int studentDegree = int.parse(stdin.readLineSync()!);
// //       students.add(studentDegree);
// //     }
// //     else
// //       print("Error! Enter your degrees again, must be 3 or more!");
// //   }
// // }
// //     //print("Student ID: ${students[i]['studentID']} , Student name: ${students[j]['studentName']}");
// //     print("Total degrees: ${students[degree]}");
// //
// //
// //   print(students);
// //
// // }
//
//
// import 'dart:io';
//
// main() {
//   List<Map> students = [];
//
//   // Get number of students
//   stdout.write('Enter the number of students: ');
//   int numStudents = int.parse(stdin.readLineSync()!);
//
//   // Get data for each student
//   for (int i = 0; i < numStudents; i++) {
//     int id;
//     String name;
//     List<int> degrees = [];
//
//     // Get ID
//     do {
//       stdout.write('Enter student ${i + 1} ID: ');
//       id = int.parse(stdin.readLineSync()!);
//     } while (id <= 0);
//
//     // Get name
//     stdout.write('Enter student ${i + 1} name: ');
//     name = stdin.readLineSync()!;
//
//     // Get at least 3 valid degrees
//     stdout.write("Enter number of subjects: ");
//     int degreeCount = int.parse(stdin.readLineSync()!);
//     while (degreeCount >= 3) {
//       stdout.write('Enter degree ${i + 1} for student ${i + 1} (must be <= 50): ');
//       int degree = int.parse(stdin.readLineSync()!);
//       if (degree <= 50) {
//         degrees.add(degree);
//         degreeCount++;
//       } else {
//         print('Degree must be smaller than or equal to 50.');
//       }
//     }
//
//     // Add student data to the list
//     students.add({
//       'id': id,
//       'name': name,
//       'degrees': degrees,
//     });
//   }
//
//
//    // print('Student ID: ${student['id']}, Name: ${student['name']}, Total Degrees: $degrees, ');
//   }
//
//




import 'dart:io';

class Car {
  String? model;
  double? price;
  String? color;int? code;

  void printCarDetails() {
    print("Model: $model, Price: $price, Color: $color, Code: $code");
  }
}

void main() {
  List<Car> cars = [];

  // User enters number of carsstdout.write("Enter number of cars: ");
  int numCars = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numCars; i++) {
    Car c = Car();

    stdout.write("Enter car model: ");
    c.model = stdin.readLineSync();

    stdout.write("Enter car price: ");
    c.price = double.parse(stdin.readLineSync()!);

    stdout.write("Enter car color: ");
    c.color = stdin.readLineSync();

    stdout.write("Enter car code: ");
    c.code = int.parse(stdin.readLineSync()!);

    cars.add(c);
  }

  // Print total price
  double totalPrice = 0;
  for (Car car in cars) {
    totalPrice += car.price!;
  }
  print("\nTotal price of all cars: $totalPrice");

  // Print each car alone
  print("\nCar Details:");
  for (Car car in cars) {
    car.printCarDetails();
  }

  // Print max & min price
  if (cars.isNotEmpty) {
    double maxPrice = cars[0].price!;
    double minPrice = cars[0].price!;

    for (Car car in cars) {
      if (car.price! > maxPrice) {
        maxPrice = car.price!;
      }
      if (car.price! < minPrice) {
        minPrice = car.price!;
      }
    }
    print("\nMax Price: $maxPrice, Min Price: $minPrice");
  } else {
    print("\nNo cars entered.");}
}