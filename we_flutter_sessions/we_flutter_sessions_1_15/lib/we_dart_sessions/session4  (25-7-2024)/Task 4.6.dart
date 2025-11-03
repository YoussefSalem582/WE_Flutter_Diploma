//------------Task6----------    input form user selecting his product and how many of it, then ask him if he needs something else?

import 'dart:io';

// main(){
//     //variables
//     double sum;
//     String ch;
//
//     double apple = 25.50;
//     double banana = 30.25;
//     double watermelon = 90.00;
//     double orange = 45.75;
//
//
//     //Input numbers from user for each product
//     print("We have apple, banana, watermelon and orange.\n which product do you want?: ");
//     String product = stdin.readLineSync()!;
//     do {
//     if(product == 'apple')
//         print('Enter how many kilos of apple do you want? ');
//         else if(product == 'banana')
//             print('Enter how many kilos of banana do you want? ');
//             else if(product == 'watermelon')
//                 print('Enter how many kilos of watermelon do you want? ');
//                 else if(product == 'orange')
//                     print('Enter how many kilos of orange do you want? ');
//                     int kilos = int.parse(stdin.readLineSync()!);
//
//         //Total price of each product
//         print("Total price of apple = ${apple*kilos}");
//
//
//
//         print("Do you need anything else? ");
//         ch = stdin.readLineSync()!;
//     } while (ch.toLowerCase() == 'yes' || ch.toLowerCase()=='y');



void main() {
    final products = {
        "apple": 25.50,
        "banana": 30.25,
        "watermelon": 90.00,
        "orange": 45.75
    };
    final order = <String, int>{};
    double totalCost = 0.0;

    bool continueShopping = true; // Corrected variable name
    while (continueShopping) {
        print("Available Products:");
        products.forEach((product, price) {
            print("$product - \$${price.toStringAsFixed(2)}");
        });

        stdout.write("Select product (or type 'done'): ");
        final selectedProduct = stdin.readLineSync() ?? '';

        if (selectedProduct.toLowerCase() == 'done') {
            continueShopping = false;
            continue; // Exit the current iteration and check the loop condition
        }

        if (products.containsKey(selectedProduct)) {
            stdout.write("Enter quantity: ");
            final quantity = int.tryParse(stdin.readLineSync() ?? '');

            if (quantity != null && quantity > 0) {
                order[selectedProduct] = (order[selectedProduct] ?? 0) + quantity;
                totalCost += products[selectedProduct]! * quantity;
            } else {
                print("Invalid quantity.");
            }
        } else {
            print("Invalid product selection.");
        }
    }

    print("\nOrder Summary:");
    order.forEach((product, quantity) {
        print("$product x $quantity - \$${(products[product]! * quantity).toStringAsFixed(2)}");
    });
    print("Total Cost: \$${totalCost.toStringAsFixed(2)}");
}
