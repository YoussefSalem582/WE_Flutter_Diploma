//----------Task2------------ " abstract"

import 'circle.dart';
import 'rectangle.dart';

void main() {
  Circle circle = Circle(radius: 5, color: 'red', filled: true);
  Rectangle rectangle = Rectangle(length: 10, width: 5, color: 'blue', filled: false);

  print(circle.toString());
  print(rectangle.toString());
}