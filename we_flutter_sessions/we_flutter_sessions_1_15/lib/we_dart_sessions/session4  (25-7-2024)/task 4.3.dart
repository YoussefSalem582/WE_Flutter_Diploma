//---------Task3-----------  " Loop "
import 'dart:io';

main() {
  print("Enter Start number and End number: ");
  int start = int.parse(stdin.readLineSync()!);
  int end = int.parse(stdin.readLineSync()!);

  print('Your output:');

  while(start > end) {
    //print(start);
    stdout.write(start);
    stdout.write(' ');
    start--;
  }

    while(start <= end) {
      //print(start);
      stdout.write(start);
      stdout.write(' ');
      start++;
    }
}