import 'point2D.dart';

class Point3d extends Point2d{
  late double _z;

  Point3d({double x=0, double y=0, double z=0}):super(x:x, y:y){
    // super.setXY(x, y);
    this._z = z;
  }

  //Setters
  void setZ(double valueZ){
    _z = valueZ;
  }
  void setXYZ(double valueX, double valueY, double valueZ) {
    // setX(valueX);
    // setY(valueY);
    super.setXY(valueX, valueY);
    _z = valueZ;
  }

  //Getters
  double getZ() {
    return _z;
  }
  List<double> getXYZ() {
    return [getX(), getY(), _z];
  }

  @override
  String toString() {
    return 'Point3D(x: ${getX()}, y: ${getY()}, z: $_z)';
  }
}