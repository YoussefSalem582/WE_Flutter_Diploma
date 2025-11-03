import 'shape.dart';

class Rectangle extends Shape {
  double length=0;
  double width=0;

  Rectangle({double length=0, double width=0, String color='', bool filled=true}){
    this.length = length;
    this.width = width;
  }

  double getArea(){
    return length * width;
  }

  double getPerimeter(){
    return 2 * (length + width);
  }

  @override
  String toString() {
    return 'Rectangle(length: $length, width: $width, color: $color, filled: $filled)';
  }
}