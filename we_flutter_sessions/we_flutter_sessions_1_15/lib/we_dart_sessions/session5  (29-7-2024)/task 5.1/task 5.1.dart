//----------------Task1-----------   " List "
// 1- take list size from user
// 2- fill list
// 3- print list in new line
// 4- print sum
// 5 - print man and min


import 'dart:io';

main(){

  List<int> mylist = [ ];
  stdout.write("Enter the size of the list: ");
  int size = int.parse(stdin.readLineSync()!);
  int sum=0;

  for(int i=0; i<size; i++)
    {
      stdout.write("Enter number ${i + 1}: ");
      mylist.add(int.parse(stdin.readLineSync()!));
      sum=sum+mylist[i];
    }
  int max=mylist[0], min=mylist[0];
  for(int i=0; i<size; i++)
    {
      if(max<mylist[i])
        max=mylist[i];
      if(min>mylist[i])
        min=mylist[i];
    }
  print("\nList: $mylist");
  print("Sum: $sum");
  print("Max: $max , Min: $min");
}





// import 'dart:io';
//
// void main() {
//   stdout.write("Enter the size of the list: ");
//   int size= int.parse(stdin.readLineSync()!);
//
//   List<int> numbers = [];
//   for (int i = 0; i < size; i++) {
//     stdout.write("Enter number ${i + 1}: ");
//     int number = int.parse(stdin.readLineSync()!);
//     numbers.add(number);
//   }
//
//   print("\nList elements:");
//   for (int number in numbers) {
//     print(number);
//   }
//
//   int sum = numbers.reduce((a, b) => a + b);
//   print("\nSum of elements: $sum");
//
//   int min = numbers.reduce((a, b) => a < b ? a : b);
//   int max = numbers.reduce((a, b) => a > b ? a : b);
//   print("Maximum element = $max ,Minimum element = $min");
// }


// import 'dart:io';
// main() {
//   // Get list size
//   print('Enter the size of the list: ');
//   int size = int.parse(stdin.readLineSync()!);
//   List<int> myList = [];
//   for (int i = 0; i < size; i++) {
//     print('Enter value: ');
//     int value = int.parse(stdin.readLineSync()!);
//     myList.add(value);
//   }
//   for (int num in myList) {
//     print(num);
//   }
//   int sum = 0;
//   for (int num in myList) {
//     sum += num;
//   }
//   int max = myList[0];
//   int min = myList[0];
//   for (int i = 0; i < myList.length; i++) {
//     if (myList[i] > max) {
//       max = myList[i];
//     }
//     if (myList[i] < min) {
//       min = myList[i];
//     }
//   }
//   print('The sum of the list is: $sum');
//   print('The maximum value in the list is: $max');
//   print('The minimum value in the list is: $min');
// }