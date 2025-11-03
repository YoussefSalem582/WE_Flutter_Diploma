double AVGList(List<num> numbers) {
  if (numbers.isEmpty) {
    return 0; // Return 0 for an empty list
  }

  double sum = 0;
  for (num number in numbers) {
    sum += number;
  }

  return sum / numbers.length;
}