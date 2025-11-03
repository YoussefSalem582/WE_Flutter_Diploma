import 'shape.dart';

class Circle extends Shape {
  double radius=0;

  Circle({double radius=0, String color='', bool filled=true}){
    this.radius = radius;

  }

  double getArea(){
    return 3.14159 * radius * radius;
  }

  double getPerimeter(){
    return 2 * 3.14159* radius;
  }

  @override
  String toString() {
    return 'circle(radius: $radius, color: $color, filled: $filled)';
  }
}