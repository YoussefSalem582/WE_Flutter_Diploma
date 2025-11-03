// import 'dart:io';
// import 'product.dart';
// import 'vistor.dart';
//
// class Admin {
//   late String name;
//   late int id;
//   List<Product> products = [];
//   List<Visitors> visitors = [];
//
//   Admin(this.name, this.id);
//
//   void addProduct() {
//     print('Enter product name:');
//     String name = stdin.readLineSync()!;
//     print('Enter product description:');
//     String description = stdin.readLineSync()!;
//     print('Enter product price:');
//     double price = double.parse(stdin.readLineSync()!);
//     print('Enter product discount (e.g., 0.1 for 10%):');
//     double discount = double.parse(stdin.readLineSync()!);
//     print('Enter product quantity:');
//     int quantity = int.parse(stdin.readLineSync()!);
//
//     Product product = Product(name, description, price, discount, quantity);
//     products.add(product);
//     print('Product ${product.name} added successfully.');
//   }
//
//   List<Map<String, dynamic>> getProductListAsMaps() {
//     return Product('', '', 0, 0, 0).createListOfMaps(products);
//   }
//
//   void addVisitor() {
//     print('Enter visitor name:');
//     String name = stdin.readLineSync()!;
//     print('Enter visitor email:');
//     String email = stdin.readLineSync()!;
//
//     int newId = visitors.isEmpty ? 1 : visitors.last.id + 1;
//     Visitors visitor = Visitors(name, email, newId, '');
//     visitors.add(visitor);
//     print('Visitor $name added successfully with ID: $newId.');
//   }
//
//   void showProducts() {
//     if (products.isEmpty) {
//       print('No products added yet.');
//       return;
//     }
//
//     print('\nAvailable Products:');
//     for (var product in products) {
//       print('- ${product.name} - \$${product.price} (Discount: ${product
//           .discount * 100}%) - Quantity: ${product.quantity}');
//     }
//   }
//
//   void showVisitors() {
//     if (visitors.isEmpty) {
//       print('No visitors registered yet.');
//       return;
//     }
//
//     print('\nRegistered Visitors:');
//     for (var visitor in visitors) {
//       print(
//           '- ${visitor.username} (ID: ${visitor.id}, Email: ${visitor.email})');
//     }
//   }
//   void removeProduct() {
//     print('Enter the name of the product to remove:');
//     String productName = stdin.readLineSync()!;
//
//     // Check if a product with the given name exists before attempting to remove
//     bool productExists = products.any((product) => product.name.toLowerCase() == productName.toLowerCase());
//
//     if (productExists) {
//       products.removeWhere((product) => product.name.toLowerCase() == productName.toLowerCase());
//       print('Product $productName removed successfully.');
//     } else {
//       print('Product $productName not found.');
//     }
//   }
// }




// import 'vistor.dart';
// import 'product.dart';
//
// class Admin {
//   late String name;
//   late int id;
//   List<Product> products = [];
//
//   Admin(this.name, this.id);
//
//   // Function to add a product to the list
//   void addProduct(String name, String description, double price, double discount, int quantity) {
//     Product product = Product(name, description, price, discount, quantity);
//     products.add(product);
//     print('Product ${product.name} added successfully.');
//   }
//
//   // Function to create a list of maps from the product list
//   List<Map> getProductListAsMaps() {
//     return Product('', '', 0, 0, 0).createListOfMaps(products);
//   }
//
//   void addVisitor(String username, String email, int id, String password) {
//     List<Visitors> addVisitor = [];
//     print('Visitor $username added successfully.');
//   }
// }


import 'dart:io';
import 'product.dart';
import 'vistor.dart';

class Admin {
  late String name;
  late int id;
  List<Product> products = [];
  List<Visitors> visitors = [];

  Admin(this.name, this.id);

  void addProduct() {
    print('Enter product name:');
    String name = stdin.readLineSync()!;
    print('Enter product description:');
    String description = stdin.readLineSync()!;
    print('Enter product price:');
    double price = double.parse(stdin.readLineSync()!);
    print('Enter product discount (e.g., 0.1 for 10%):');
    double discount = double.parse(stdin.readLineSync()!);
    print('Enter product quantity:');
    int quantity = int.parse(stdin.readLineSync()!);

    Product product = Product(name, description, price, discount, quantity);
    products.add(product);
    print('Product ${product.name} added successfully.');
  }

  List<Map<String, dynamic>> getProductListAsMaps() {
    return Product('', '', 0, 0, 0).createListOfMaps(products);
  }

  void addVisitor() {
    print('Enter visitor name:');
    String name = stdin.readLineSync()!;

    // Validate visitor name
    if (!_isValidName(name)) {
      print('Invalid name. Name should only contain alphabets and should not be empty.');
      return;
    }

    print('Enter visitor email:');
    String email = stdin.readLineSync()!;

    int newId = visitors.isEmpty ? 1 : visitors.last.id + 1;
    Visitors visitor = Visitors(name, email, newId, '');
    visitors.add(visitor);
    print('Visitor $name added successfully with ID: $newId.');
  }

  void showProducts() {
    if (products.isEmpty) {
      print('No products added yet.');
      return;
    }

    print('\nAvailable Products:');
    for (var product in products) {
      print('- ${product.name} - \$${product.price} (Discount: ${product.discount * 100}%) - Quantity: ${product.quantity}');
    }
  }

  void showVisitors() {
    if (visitors.isEmpty) {
      print('No visitors registered yet.');
      return;
    }

    print('\nRegistered Visitors:');
    for (var visitor in visitors) {
      print('- ${visitor.username} (ID: ${visitor.id}, Email: ${visitor.email})');
    }
  }

  void removeProduct() {
    print('Enter the name of the product to remove:');
    String productName = stdin.readLineSync()!;

    bool productExists = products.any((product) => product.name.toLowerCase() == productName.toLowerCase());

    if (productExists) {
      products.removeWhere((product) => product.name.toLowerCase() == productName.toLowerCase());
      print('Product $productName removed successfully.');
    } else {
      print('Product $productName not found.');
    }
  }

  bool _isValidName(String name) {
    // Check if the name is empty or contains non-alphabetic characters
    return name.isNotEmpty && RegExp(r'^[a-zA-Z\s]+$').hasMatch(name);
  }
}
