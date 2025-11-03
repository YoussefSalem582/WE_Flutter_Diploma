//-----------Task2----------    " Function "

import 'dart:io';

main(){
  List<int> numbers = [];
  getList(numbers);
  print("\n");
  showList(numbers);
  print("Sum: ${SumList(numbers)}");
  print("Average: ${AVGList(numbers)}");

  // Map Max and Min List
  Map<String, int> maxMinMap = findMaxMin(numbers);
  print("Max: ${maxMinMap['max']}, Min: ${maxMinMap['min']}");
}

//---1
void getList(List<int>numbers){
  stdout.write("Enter how many numbers do you want: ");
  int size = int.parse(stdin.readLineSync()!);
  for(int i=0; i<size; i++) {
      stdout.write("Enter your numbers: ");
      int num = int.parse(stdin.readLineSync()!);
      numbers.add(num);
  }
}

//---2
void showList(List numbers){
  print("List: $numbers");
}

//---3
int SumList(List<int>numbers){
  int sum = 0;
  for(int i=0; i<numbers.length; i++)
    sum+=numbers[i];
  return sum;
}

//---4
double AVGList(List<int>numbers){
  if(numbers.isEmpty) {
    return 0;
  }
  double sum = 0;
  for(num number in numbers){
    sum += number;
}

return sum / numbers.length;
}


//---5 (Added for Map Max and Min)
Map<String, int> findMaxMin(List<int> numbers) {
  if (numbers.isEmpty) {
    return {'max': 0, 'min': 0};
  }
  int max = numbers[0];
  int min = numbers[0];

  for (int number in numbers) {
    if (number > max) {
      max = number;
    }
    if (number <min) {
      min = number;
    }
  }
  return {'max': max, 'min': min};
}