//---------Task5----------
import 'dart:io';

main(){

    print("Enter your numbers: ");
    int num1 = int.parse(stdin.readLineSync()!);
    print("$num1 * ... = ");

    int num2 = int.parse(stdin.readLineSync()!);
    print("$num1 * $num2 = ... ");

    int num3 = int.parse(stdin.readLineSync()!);
    print("$num1 * $num2 = from $num3 to ... ");

    int num4 = int.parse(stdin.readLineSync()!);
    print("$num1 * $num2 = from $num3 to $num4\n ");

    for (int n1 = num1; n1 <= num2; n1++) {
      print("Line $n1");
      for (int n2 = num3; n2 <= num4; n2++) {
        stdout.write("$n1 * $n2 = ${n1 * n2}");
        stdout.write(", ");
      }
      print(" ");
    }

}