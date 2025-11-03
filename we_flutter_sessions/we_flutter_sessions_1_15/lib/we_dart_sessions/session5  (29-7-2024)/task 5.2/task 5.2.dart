//-----------Task2-------------  " List "
//1- add value
//2- remove value
//3- update value
//4- show value
//5- search value

// import 'dart:io';
//
// main(){
//   List<int> mylist = [ ];
//   print("Select what do you want to do at the list:\n1- add value:\n2- remove value:\n3- update value:\n4- show value:\n5- search value:");
//
//   int input = int.parse(stdin.readLineSync()!);
//   int sum=0;
//
// //1- add
//   for(int i=0; i<input; i++)
//   {
//     mylist.add(int.parse(stdin.readLineSync()!));
//     sum=sum+mylist[i];
//   }
//
//   //2- remove
//   for(int i=0; i<input; i++)
//   {
//     mylist.remove(int.parse(stdin.readLineSync()!));
//   }
//
//   //3- update
//   for(int i=0; i<input; i++)
//   {
//     mylist.replaceRange(int.parse(stdin.readLineSync()!), int.parse(stdin.readLineSync()!));
//   }
//
//   //4- show
//   print(mylist);
//
//   //5- search
//   for(int i=0; i<input; i++)
//   {
//     mylist.getRange(int.parse(stdin.readLineSync()!) ,int.parse(stdin.readLineSync()!));
//   }
//
// }


import 'dart:io';
main() {
  List<int> myList = [];
  bool listNotEmpty = false;

  while (true) {
    print('1-add value\n2-remove value\n3-update value\n4-show value\n5-search value');
    print("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        print("Enter value to add: ");
        int value = int.parse(stdin.readLineSync()!);
        myList.add(value);
        listNotEmpty = true;
        break;
      case 2:
        if (listNotEmpty) {
          print("a) Remove by value");
          print("b) Remove by index");
          print("Enter your choice: ");
          String removeChoice = stdin.readLineSync()!;
          if (removeChoice == 'a') {
            print("Enter value to remove: ");
            int value = int.parse(stdin.readLineSync()!);

            if (myList.contains(value)) {
              myList.remove(value); // Removes the first occurrence of the value
              print("Value removed successfully.");
            } else {
              print("Value not found in the list.");
            }
          }else if (removeChoice == 'b') {
            print("Enter index to remove: ");
            int index = int.parse(stdin.readLineSync()!);
            if (index >= 0 && index < myList.length) {
              myList.removeAt(index);
            } else {
              print("Invalid index");
            }
          } else {
            print("Invalid choice");
          }
        } else {
          print("The list is empty.");
        }
        break;
      case 3:
        if (listNotEmpty) {
          print("Enter old value: ");
          int oldValue = int.parse(stdin.readLineSync()!);
          if (myList.contains(oldValue)) { // Check if oldValue exists in the list
            print("Enter new value: ");
            int newValue = int.parse(stdin.readLineSync()!);
            int index = myList.indexOf(oldValue);
            myList[index] = newValue;
          } else {
            print("Value not found");
          }
        } else {
          print("List is empty.");
        }
        break;
      case 4:
        if (listNotEmpty) {
          print("List:");
          for (int value in myList) {
            print(value);
          }
        } else {
          print("The list is empty.");
        }
        break;
      case 5:
        if (listNotEmpty) {
          print("Enter value to search: ");
          int value = int.parse(stdin.readLineSync()!);
          if (myList.contains(value)) {
            print("Value found");
            print("Index: ${myList.indexOf(value)}");
          } else {
            print("Value not found");
          }
        } else {
          print("The list is empty.");
        }
        break;
      case 6:
      default:
        print("Invalid choice");
    }
    print("Do you want anything else? (y/n): ");
    String answer = stdin.readLineSync()!.toLowerCase();
    if (answer != 'y') {
      break;
    }
  }
}