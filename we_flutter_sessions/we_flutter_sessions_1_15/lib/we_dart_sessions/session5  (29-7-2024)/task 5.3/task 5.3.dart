//-----------Task3------------  " Map "
// 1- take list size from user
// 2- fill list
// 3- print list in new line
// 4- print sum
// 5 - print man and min


import 'dart:io';

void main() {
  Map<int, int> myMap = {};
  stdout.write("Enter the size of the map: ");
  int size = int.parse(stdin.readLineSync()!);

  int sum = 0;
  for (int i = 0; i < size; i++) {
    stdout.write("Enter key ${i + 1}: ");
    int key = int.parse(stdin.readLineSync()!);
    stdout.write("Enter value for key $key: ");
    int value = int.parse(stdin.readLineSync()!);
    myMap[key] = value;
    sum += value;
  }

  int max = myMap.values.first;
  int min = myMap.values.first;
  for (int value in myMap.values) {
    if (max < value) {
      max = value;
    }
    if (min > value) {min = value;
    }
  }

  print("\nMap: $myMap");
  print("Sum of values: $sum");
  print("Max value: $max , Min value: $min");
}