// import 'dart:io';
// import 'product.dart';
// import 'admin.dart';
// import 'vistor.dart';
// import 'shoppingCart.dart';
//
// void main() {
//   Admin admin = Admin('Admin User', 1);
//   ShoppingCart cart = ShoppingCart();
//
//   while (true) {
//     print('\nChoose an action:');
//     print('1. Admin');
//     print('2. User');
//     print('3. Exit');
//
//     String choice = stdin.readLineSync()!;
//
//     if (choice == '1') {
//       String adminChoice;
//       do {
//         print(
//             '1. Add product\n'
//                 '2. Add visitor\n'
//                 '3. Show products\n'
//                 '4. Show visitors\n'
//                 '5. Remove Product\n'
//                 '6. Exit');
//         adminChoice = stdin.readLineSync()!;
//         switch (adminChoice) {
//           case '1':
//             admin.addProduct();
//             break;
//           case '2':
//             admin.addVisitor();
//             break;
//           case '3':
//             admin.showProducts();
//             break;
//           case '4':
//             admin.showVisitors();
//             break;
//           case '5':
//             admin.removeProduct();
//             break;
//           case '6':
//             break;
//           default:
//             print('Invalid choice.');
//         }
//       } while (adminChoice != '6');
//     } else if (choice == '2') {
//       while (true) {
//         print('\nUser Actions:');
//         print('1. View Products');
//         print('2. Add to Cart');
//         print('3. Remove from Cart');
//         print('4. View Cart');
//         print('5. Back to Main Menu');
//
//         String userChoice = stdin.readLineSync()!;
//
//         if (userChoice == '1') {
//           List<Map<String, dynamic>> productList = admin.getProductListAsMaps();
//           if (productList.isEmpty) {
//             print('No products available yet.');
//           }
//           else {
//             print('\nAvailable Products:');
//             productList.forEach((product) {
//               print('- ${product['name']} - \$${product['price']} (Discount: ${product['discount'] * 100}%)');
//             }
//             );
//           }
//         } else if (userChoice == '2') {
//           print('Enter the name of the product to add to cart:');
//           String productName = stdin.readLineSync()!;
//           print('Enter the quantity of the product to add to cart:');
//           int productQuantity = int.parse(stdin.readLineSync()!);
//
//           bool productExists = admin.products.any((product) => product.name.toLowerCase() == productName.toLowerCase());
//
//           if (productExists) {
//             Product productToAdd = admin.products.firstWhere(
//                   (product) => product.name.toLowerCase() == productName.toLowerCase(),
//             );
//
//             // Check if enough quantity is available
//             if (productToAdd.quantity >= productQuantity) {
//               // Create a new Product object with the desired quantity
//               Product cartProduct = Product(
//                 productToAdd.name,
//                 productToAdd.description,
//                 productToAdd.price,
//                 productToAdd.discount,
//                 productQuantity,
//               );
//               cart.addProduct(cartProduct);
//
//               // Update the quantity in the admin's product list
//               productToAdd.quantity -= productQuantity;
//             } else {
//               print('Not enough quantity available. Available quantity: ${productToAdd.quantity}');
//             }
//           } else {
//             print('Product not found.');
//           }
//         } else if (userChoice == '3') {
//           print('Enter the name of the product to remove from cart:');
//           String productName = stdin.readLineSync()!;
//           cart.delProduct(productName);
//         } else if (userChoice == '4') {
//           cart.displayCart();
//         } else if (userChoice == '5') {
//           break;
//         } else {
//           print('Invalid choice.');
//         }
//       }
//     } else if (choice == '3') {
//       break;
//     } else {
//       print('Invalid choice.');
//     }
//   }
// }
import 'dart:io';
import 'product.dart';
import 'admin.dart';
import 'vistor.dart';
import 'shoppingCart.dart';

void main() {
  Admin admin = Admin('Admin User', 1);
  ShoppingCart cart = ShoppingCart();

  while (true) {
    print('\nChoose an action:');
    print('1. Admin');
    print('2. User');
    print('3. Exit');

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        handleAdminActions(admin);
        break;
      case '2':
        handleUserActions(admin, cart);
        break;
      case '3':
        print('Exiting the program.');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void handleAdminActions(Admin admin) {
  while (true) {
    print(
        '\nAdmin Actions:\n'
            '1. Add product\n'
            '2. Add visitor\n'
            '3. Show products\n'
            '4. Show visitors\n'
            '5. Remove Product\n'
            '6. Back to Main Menu');

    String adminChoice = stdin.readLineSync()!;

    switch (adminChoice) {
      case '1':
        admin.addProduct();
        break;
      case '2':
        admin.addVisitor();
        break;
      case '3':
        admin.showProducts();
        break;
      case '4':
        admin.showVisitors();
        break;
      case '5':
        admin.removeProduct();
        break;
      case '6':
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void handleUserActions(Admin admin, ShoppingCart cart) {
  if (admin.visitors.isEmpty) {
    print('No visitors available. Please contact the admin to add visitors.');
    return;
  }

  print('Please select your name from the list to continue:');
  for (int i = 0; i < admin.visitors.length; i++) {
    print('${i + 1}. ${admin.visitors[i].username}');
  }

  int userChoice;
  do {
    print('Enter the number corresponding to your name:');
    userChoice = int.parse(stdin.readLineSync()!);
  } while (userChoice < 1 || userChoice > admin.visitors.length);

  Visitors selectedVisitor = admin.visitors[userChoice - 1];

  print('Welcome, ${selectedVisitor.username}!');

  while (true) {
    print(
        '\nUser Actions:\n'
            '1. View Products\n'
            '2. Add to Cart\n'
            '3. Remove from Cart\n'
            '4. View Cart\n'

            '5. Back to Main Menu');

    String userActionChoice = stdin.readLineSync()!;

    switch (userActionChoice) {
      case '1':
        viewProducts(admin);
        break;
      case '2':
        addToCart(admin, cart);
        break;
      case '3':
        removeFromCart(cart);
        break;
      case '4':
        cart.displayCart();
        break;
      case '5':
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void viewProducts(Admin admin) {
  List<Map<String, dynamic>> productList = admin.getProductListAsMaps();
  if (productList.isEmpty) {
    print('No products available yet.');
  } else {
    print('\nAvailable Products:');
    productList.forEach((product) {
      print('- ${product['name']} - \$${product['price']} (Discount: ${product['discount'] * 100}%)');
    });
  }
}

void addToCart(Admin admin, ShoppingCart cart) {
  print('Enter the name of the product to add to cart:');
  String productName = stdin.readLineSync()!;
  print('Enter the quantity of the product to add to cart:');
  int productQuantity = int.parse(stdin.readLineSync()!);

  bool productExists = admin.products.any((product) => product.name.toLowerCase() == productName.toLowerCase());

  if (productExists) {
    Product productToAdd = admin.products.firstWhere(
          (product) => product.name.toLowerCase() == productName.toLowerCase(),
    );

    if (productToAdd.quantity >= productQuantity) {
      Product cartProduct = Product(
        productToAdd.name,
        productToAdd.description,
        productToAdd.price,
        productToAdd.discount,
        productQuantity,
      );
      cart.addProduct(cartProduct);

      productToAdd.quantity -= productQuantity;
      print('${productQuantity} x ${productToAdd.name} added to cart.');
    } else {
      print('Not enough quantity available. Available quantity: ${productToAdd.quantity}');
    }
  } else {
    print('Product not found.');
  }
}

void removeFromCart(ShoppingCart cart) {
  print('Enter the name of the product to remove from cart:');
  String productName = stdin.readLineSync()!;
  cart.delProduct(productName);
}
