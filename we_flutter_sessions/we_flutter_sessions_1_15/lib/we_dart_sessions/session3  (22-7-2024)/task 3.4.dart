//--------------Task4
import 'dart:io';

main(){

  //variables
  double sum;

  double apple = 25.50;
  double banana = 30.25;
  double watermelon = 90.00;
  double orange = 45.75;

  //Input numbers from user for each product
  print("Enter number of apples: ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter number of bananas: ");
  int b = int.parse(stdin.readLineSync()!);

  print("Enter number of watermelons: ");
  int w = int.parse(stdin.readLineSync()!);

  print("Enter number of oranges: ");
  int o = int.parse(stdin.readLineSync()!);

  //Total price of each product
  print("Total price of apples = ${a*apple}");
  print("Total price of Bananas = ${b*banana}");
  print("Total price of watermelons = ${w*watermelon}");
  print("Total price of Oranges = ${o*orange}\n");

  //Total price
  print("Total price without discount = ${sum = (a*apple
      +b*banana
      +w*watermelon
      +o*orange)
  }" );
  print("Total price with discount = ${sum -(
      ((a*apple/100) * 15)
      +((b*banana/100) * 7.5)
      +((w*watermelon/100) * 10)
      +((o*orange/100) * 15)
  )}" );
}