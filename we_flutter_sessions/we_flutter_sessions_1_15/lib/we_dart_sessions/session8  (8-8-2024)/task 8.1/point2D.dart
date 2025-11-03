
class Point2d{
  late double _x;
  late double _y;

  //constructor
  Point2d({double x=0, double y=0}){
    this._x = x;
    this._y = y;
  }

  //Setters
  void setX(double valueX){
    _x = valueX;
  }
  void setY(double valueY){
    _y = valueY;
  }
  void setXY(double valueX, double valueY){
    _x = valueX;
    _y = valueY;
  }

  //Getters
  double getX() {
   return _x;
 }
 double getY(){
    return _y;
 }
 // List getXY(){
 //    List XY = [_x, _y];
 //    return XY;
 // }
  List<double> getXY() {
    return [_x, _y];
  }

  @override
  String toString() {
    return 'Point2D(x: $_x, y: $_y)';
  }
}