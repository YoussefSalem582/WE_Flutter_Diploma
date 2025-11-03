abstract class Shape{
  late String color;
  late bool filled;

  //constructor
  Shape({String color='', bool filled=true}){
    this.color = color;
    this.filled = filled;
  }

  double getArea();

  double getPerimeter();

  String toString();
}