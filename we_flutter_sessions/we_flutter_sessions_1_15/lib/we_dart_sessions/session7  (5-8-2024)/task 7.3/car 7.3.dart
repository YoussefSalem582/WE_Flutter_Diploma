class Car {
  late String model;
  late double price;
  late String color;
  late int code;


  //Constructor
  Car({String model = '',
    double price = 0,
    String color = '',
    int code = 0
  })
  {
    this.model = model;
    this.price = price;
    this.color = color;
    this.code = code;
  }

  void printEmployee(){
    print("\nCar model: $model");
    print("Car price: $price");
    print("Car color: $color");
    print("Car code: $code\n");
  }
}